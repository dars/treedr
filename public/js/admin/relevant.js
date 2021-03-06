var rv_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({
		method:'post',
		url:base_url+'admin/relevant'
	}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'created',type:'string'},
		{name:'modified',type:'string'}
	]
});
rv_ds.on('load',function(){
	rv_form.getForm().loadRecord(rv_ds.getAt(0));
});
var rv_form = new Ext.form.FormPanel({
	title:'相關規定法令',
	labelAlign:'right',
	labelWidth:100,
	frame:true,
	defaults:{
		anchor:'85%',
		msgTarget:'side'
	},
	items:[{
		xtype:'displayfield',
		fieldLabel:'標題',
		value:'相關規定法令'
	},{
		xtype:'ckeditor',
		fieldLabel:'內容',
		layout:'fit',
		name:'content'
	},{
		xtype:'displayfield',
		fieldLabel:'最後更新時間',
		name:'modified'
	},{
		xtype:'hidden',
		name:'id'
	}],
	buttons:[{
		text:'儲存',
		handler:function(){
			rv_form.getForm().submit({
				url:base_url+'admin/relevant_save',
				success:function(){
					show_Growl(1,'訊息','資料已儲存');
				}
			});
		}
	}]
});