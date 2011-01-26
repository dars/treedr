var hyperlinks_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+'admin/hyperlinks'}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'modified',type:'string'}
	]
});
var hyperlinks_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'連結名稱',dataIndex:'title',id:'hyperlinks_title'},
	{header:'更新時間',dataIndex:'modified',width:120}
]);
var hyperlinks_grid = new Ext.grid.GridPanel({
	region:'center',
	cm:hyperlinks_cm,
	store:hyperlinks_ds,
	autoScroll:true,
	title:'友善連結列表',
	autoExpandColumn:'hyperlinks_title',
	stripeRows:true,
	enableHdMenu:false
});
hyperlinks_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	hyperlinks_form.getForm().loadRecord(r);
	hyperlinks_form.buttons[0].setText('修改');
});
var hyperlinks_form = new Ext.form.FormPanel({
	region:'north',
	height:120,
	autoScroll:true,
	labelAlign:'left',
	title:'友善連結表單',
	labelWidth:80,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id',
		allowBlank:true
	},{
		xtype:'textfield',
		fieldLabel:'連結名稱',
		name:'title'
	},{
		xtype:'textfield',
		fieldLabel:'連結網址',
		name:'content'
	}],
	buttons:[{
		text:'新增',
		handler:function(){
			if(hyperlinks_form.getForm().isValid()){
				hyperlinks_form.getForm().submit({
					url:base_url+'admin/hyperlinks_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						hyperlinks_form.getForm().reset();
						hyperlinks_ds.load();
						hyperlinks_form.buttons[0].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			hyperlinks_form.getForm().reset();
			hyperlinks_form.buttons[0].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = hyperlinks_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						hyperlinks_form.getForm().reset();
						hyperlinks_ds.load();
						hyperlinks_form.buttons[0].setText('新增');
					}
				});
			}
		}
	}]
});

var hyperlinks = {
	layout:'border',
	id:'hyperlinks_browser',
	items:[hyperlinks_grid,hyperlinks_form]
}