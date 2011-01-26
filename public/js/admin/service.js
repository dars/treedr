var service_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+'admin/service'}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'modified',type:'string'}
	]
});
var service_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'標題',dataIndex:'title',id:'service_title'},
	{header:'更新時間',dataIndex:'modified',width:120}
]);
var service_grid = new Ext.grid.GridPanel({
	region:'north',
	cm:service_cm,
	store:service_ds,
	autoScroll:true,
	height:200,
	title:'服務項目列表',
	autoExpandColumn:'service_title',
	stripeRows:true,
	enableHdMenu:false
});
service_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	service_form.getForm().loadRecord(r);
	service_form.buttons[0].setText('修改');
});
var service_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'left',
	title:'服務項目表單',
	labelWidth:40,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id',
		allowBlank:true
	},{
		xtype:'textfield',
		fieldLabel:'標題',
		name:'title'
	},{
		xtype:'ckeditor',
		fieldLabel:'內容',
		name:'content'
	}],
	buttons:[{
		text:'新增',
		handler:function(){
			if(service_form.getForm().isValid()){
				service_form.getForm().submit({
					url:base_url+'admin/service_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						service_form.getForm().reset();
						service_ds.load();
						service_form.buttons[0].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			service_form.getForm().reset();
			service_form.buttons[0].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = service_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						service_form.getForm().reset();
						service_ds.load();
						service_form.buttons[0].setText('新增');
					}
				});
			}
		}
	}]
});

var service = {
	layout:'border',
	id:'service_browser',
	items:[service_grid,service_form]
}