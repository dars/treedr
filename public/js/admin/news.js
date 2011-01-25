var news_taxo_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/taxo_list/1"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'name',type:'string'}
	]
});
var news_combo = new Ext.form.ComboBox({
	
});
var news_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'right',
	title:'最新消息表單',
	labelWidth:100,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side'},
	items:[{
		xtype:'hidden',
		name:'id'
	},{
		xtype:'textfield',
		fieldLabel:'標題',
		name:'title',
	},{
		xtype:'ckeditor',
		fieldLabel:'內容',
		name:'content'
	}],
	buttons:[{
		text:'儲存',
		handler:function(){
			
		}
	},{
		text:'清除',
		handler:function(){
			
		}
	}]
});
var news = {
	layout:'border',
	id:'news_browser',
	items:[{
		collapsible: true,
		region:'west',
		html:'WEST',
		width:150
	},{
		region:'center',
		layout:'border',
		items:[{
			region:'north',
			html:'列表'
		},news_form]
	}]
};