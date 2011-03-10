var pix_form = new Ext.form.FormPanel({
	region:'north',
	labelAlign:'right',
	labelWidth:100,
	height:150,
	title:'上傳表單',
	frame:true,
	fileUpload:true,
	defaults:{anchor:'95%',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id'
	},{
		xtype:'hidden',
		name:'n_id'
	},{
		xtype:'textfield',
		fieldLabel:'標題',
		name:'title'
	},{
		xtype:'textfield',
		fieldLabel:'圖說',
		name:'content'
	},{
		xtype:'fileuploadfield',
		buttonText:'瀏覽',
		fieldLabel:'圖片上傳',
		name:'img',
		allowBlank:false
	}],
	buttons:[{
		text:'上傳',
		handler:function(){
			if(pix_form.getForm().isValid()){
				pix_form.getForm().submit({
					url:base_url+'admin/images_upload',
					success:function(form,action){
						show_Growl(1,'訊息','資料已儲存');
						pix_ds.load({params:{n_id:action.result.n_id}});
						pix_form.getForm().reset();
						pix_form.getForm().findField('img').setDisabled(false);
						pix_form.buttons[0].setText("上傳");
					}
				});
			}
		}
	}]
});
var pix_tpl = new Ext.XTemplate(
	'<tpl for=".">',
		'<div class="thumb-wrap" id="{id}">',
		'<div class="thumb"><img src="'+base_url+'public/files/images/{name}" title="{name}"></div>',
		'<span class="x-editable">{shortname}</span></div>',
	'</tpl>',
	'<div class="x-clear"></div>'
);
var pix_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/images_list"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'name',type:'string'}
	]
});
var pix_dv = new Ext.DataView({
	store:pix_ds,
	tpl:pix_tpl,
	autoHeight:true,
	multiSelect:true,
	overClass:'x-view-over',
	itemSelector:'div.thumb-wrap',
	emptyText:'無圖片',
	plugins:[
		new Ext.DataView.DragSelector()
		//new Ext.DataView.LabelEditor({dataIndex:'name'})
	],
	prepareData:function(data){
		data.shortname = Ext.util.Format.ellipsis(data.name, 15);
		return data;
	},
	listeners:{
		dblclick:{
			fn:function(dataView,index,node,e){
				var record = dataView.getRecord(node);
				pix_form.getForm().loadRecord(record);
				pix_form.getForm().findField('img').setDisabled(true);
				pix_form.buttons[0].setText("修改");
			}
		}
	}
});
var pix_panel = new Ext.Panel({
	id:'images-view',
	region:'center',
	frame:true,
	height:300,
	layout:'fit',
	title:'圖片瀏覽',
	autoScroll:true,
	tbar:new Ext.Toolbar({
		style: 'border:1px solid #99BBE8;',
		items:['->',{
			text:'設為主要照片',
			handler:function(){
				var r = pix_dv.getSelectedRecords();
				var tmp_id = r[0].data.id;
				var tmp_n_id = pix_form.getForm().findField('n_id').getValue();
				Ext.Ajax.request({
					url:base_url+'admin/images_set_main',
					params:'id='+tmp_id+'&n_id='+tmp_n_id,
					success:function(){
						show_Growl(1,'訊息','設定已完成');
					}
				});
			}
		},{
			text:'刪除',
			handler:function(){
				var r = pix_dv.getSelectedRecords();
				if(r.length != 0){
					par='';
					for(i=0;i<r.length;i++){
						if(i>0){
							par+='&';
						}
						par+='foo[]='+r[i].data.id;
					}
				}
				Ext.Ajax.request({
					url:base_url+'admin/images_destory',
					params:par,
					success:function(){
						show_Growl(1,'訊息','圖片已刪除');
						pix_ds.load();
						pix_form.getForm().reset();
					}
				});
			}
		}]
	}),
	items:[pix_dv]
});
var pix_win = new Ext.Window({
	modal:true,
	title:'圖片上傳',
	width:600,
	height:500,
	layout:'border',
	closeAction:'hide',
	items:[pix_form,pix_panel]
});