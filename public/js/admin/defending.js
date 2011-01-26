var defending_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+'admin/defending'}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'modified',type:'string'}
	]
});
var defending_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'標題',dataIndex:'title',id:'defending_title'},
	{header:'更新時間',dataIndex:'modified',width:120}
]);
var defending_grid = new Ext.grid.GridPanel({
	region:'north',
	cm:defending_cm,
	store:defending_ds,
	autoScroll:true,
	height:200,
	title:'樹木醫生列表',
	autoExpandColumn:'defending_title',
	stripeRows:true,
	enableHdMenu:false
});
defending_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	defending_form.getForm().loadRecord(r);
	defending_form.buttons[0].setText('修改');
});
var defending_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'left',
	title:'樹木醫生表單',
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
			if(defending_form.getForm().isValid()){
				defending_form.getForm().submit({
					url:base_url+'admin/defending_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						defending_form.getForm().reset();
						defending_ds.load();
						defending_form.buttons[0].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			defending_form.getForm().reset();
			defending_form.buttons[0].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = defending_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						defending_form.getForm().reset();
						defending_ds.load();
						defending_form.buttons[0].setText('新增');
					}
				});
			}
		}
	}]
});

var defending = {
	layout:'border',
	id:'defending_browser',
	items:[defending_grid,defending_form]
}