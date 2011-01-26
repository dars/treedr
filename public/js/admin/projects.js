var projects_taxo_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/taxo_list/7"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'name',type:'string'}
	]
});

var projects_taxo_cm = new Ext.grid.ColumnModel([
	{header:'id',dataIndex:'id',hidden:true},
	{header:'名稱',dataIndex:'name',id:'projects_taxo_name'},
	{
		align:'right',
		xtype: 'actioncolumn',
		items: [{
			icon:base_url+'public/images/fam/delete.gif',
			tooltip:'刪除此分類',
			handler:function(grid, rowIndex, colIndex) {
				var rec = projects_taxo_ds.getAt(rowIndex);
				var tmp_id = rec.get('id');
				Ext.Msg.confirm('訊息','確定刪除此分類？ 相關的資料將會變成未分類狀態',function(btn){
					if(btn === 'yes'){
						Ext.Ajax.request({
							url:base_url+'admin/taxo_delete',
							params:'id='+tmp_id,
							success:function(){
								show_Growl(1,'訊息','刪除已完成');
								projects_form.getForm().reset();
								projects_taxo_ds.load();
								projects_ds.load();
								projects_form.buttons[1].setText('新增');
							}
						});
					}
				});
			}
		}]
	}
]);
var projects_taxo_grid = new Ext.grid.GridPanel({
	collapsible:true,
	region:'west',
	title:'分類列表',
	width:200,
	autoExpandColumn:'projects_taxo_name',
	viewConfig:{forceFit:true},
	cm:projects_taxo_cm,
	store:projects_taxo_ds,
	enableHdMenu:false,
	stripeRows:true
});

var projects_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/projects"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'tname',type:'string'},
		{name:'t_id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'name',type:'string'},
		{name:'years',type:'string'},
		{name:'created',type:'string'},
		{name:'modified',type:'string'}
	]
});

var projects_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'id',dataIndex:'id',hidden:true},
	{header:'類別',dataIndex:'tname'},
	{header:'工程名',dataIndex:'title',id:'projects_title'},
	{header:'業主名',dataIndex:'name'},
	{header:'更新時間',dataIndex:'modified',width:120}
]);
var projects_grid = new Ext.grid.GridPanel({
	region:'north',
	cm:projects_cm,
	store:projects_ds,
	title:'專案展示列表',
	height:200,
	autoExpandColumn:'projects_title',
	stripeRows:true,
	enableHdMenu:false
});
projects_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	projects_form.getForm().loadRecord(r);
	projects_form.buttons[1].setText('修改');
});
var projects_combo = new Ext.form.ComboBox({
	fieldLabel:'類別',
	id:'projects_combo',
	store:projects_taxo_ds,
	mode:'local',
	hiddenName:'t_id',
	displayField:'name',
	valueField:'id',
	emptyText:'請選擇',
	allowBlank:false
});

var projects_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'left',
	title:'專案展示表單',
	labelWidth:60,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id',
		allowBlank:true
	},projects_combo,{
		xtype:'textfield',
		fieldLabel:'工程名',
		name:'title',
	},{
		xtype:'textfield',
		fieldLabel:'業主名',
		name:'name',
	},{
		xtype:'textfield',
		fieldLabel:'年度',
		name:'years',
	},{
		xtype:'ckeditor',
		fieldLabel:'內容',
		name:'content'
	}],
	buttons:[{
		text:'上傳圖片',
		handler:function(){
			var tmp_id = projects_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','需先儲存才能上傳圖片');
			}else{
				pix_form.getForm().findField('n_id').setValue(tmp_id);
				pix_ds.load({params:{n_id:tmp_id}});
				pix_win.show();
			}
		}
	},{
		text:'新增',
		handler:function(){
			if(projects_form.getForm().isValid()){
				projects_form.getForm().submit({
					url:base_url+'admin/projects_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						projects_form.getForm().reset();
						projects_taxo_ds.load();
						projects_ds.load();
						projects_form.buttons[1].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			projects_form.getForm().reset();
			projects_form.buttons[1].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = projects_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						projects_form.getForm().reset();
						projects_taxo_ds.load();
						projects_ds.load();
						projects_form.buttons[1].setText('新增');
					}
				});
			}
		}
	}]
});
var pix_form = new Ext.form.FormPanel({
	region:'north',
	labelAlign:'right',
	labelWidth:100,
	height:100,
	title:'上傳表單',
	frame:true,
	fileUpload:true,
	defaults:{anchor:'95%'},
	items:[{
		xtype:'hidden',
		fieldLabel:'ID',
		name:'n_id'
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
					success:function(){
						show_Growl(1,'訊息','圖片已上傳');
						pix_ds.load();
						pix_form.getForm().reset();
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
		new Ext.DataView.DragSelector(),
		new Ext.DataView.LabelEditor({dataIndex:'name'})
	],
	prepareData:function(data){
		data.shortname = Ext.util.Format.ellipsis(data.name, 15);
		return data;
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
	el:'projects_img',
	modal:true,
	title:'圖片上傳',
	width:600,
	height:500,
	layout:'border',
	closeAction:'hide',
	items:[pix_form,pix_panel]
});
var projects = {
	layout:'border',
	id:'projects_browser',
	items:[projects_taxo_grid,{
		region:'center',
		layout:'border',
		items:[projects_grid,projects_form]
	}]
};