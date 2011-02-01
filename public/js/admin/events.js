var events_taxo_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/taxo_list/8"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'name',type:'string'}
	]
});

var events_taxo_cm = new Ext.grid.ColumnModel([
	{header:'id',dataIndex:'id',hidden:true},
	{header:'名稱',dataIndex:'name',id:'events_taxo_name'},
	{
		align:'right',
		xtype: 'actioncolumn',
		items: [{
			icon:base_url+'public/images/fam/delete.gif',
			tooltip:'刪除此分類',
			handler:function(grid, rowIndex, colIndex) {
				var rec = events_taxo_ds.getAt(rowIndex);
				var tmp_id = rec.get('id');
				Ext.Msg.confirm('訊息','確定刪除此分類？ 相關的資料將會變成未分類狀態',function(btn){
					if(btn === 'yes'){
						Ext.Ajax.request({
							url:base_url+'admin/taxo_delete',
							params:'id='+tmp_id,
							success:function(){
								show_Growl(1,'訊息','刪除已完成');
								events_form.getForm().reset();
								events_taxo_ds.load();
								events_ds.load();
								events_form.buttons[0].setText('新增');
							}
						});
					}
				});
			}
		}]
	}
]);
var events_taxo_grid = new Ext.grid.GridPanel({
	collapsible:true,
	region:'west',
	title:'分類列表',
	width:200,
	autoExpandColumn:'events_taxo_name',
	viewConfig:{forceFit:true},
	cm:events_taxo_cm,
	store:events_taxo_ds,
	enableHdMenu:false,
	stripeRows:true
});

var events_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/events"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'tname',type:'string'},
		{name:'t_id',type:'int'},
		{name:'title',type:'string'},
		{name:'content',type:'string'},
		{name:'created',type:'string'},
		{name:'modified',type:'string'}
	]
});

var events_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'id',dataIndex:'id',hidden:true},
	{header:'類別',dataIndex:'tname'},
	{header:'活動講座名稱',dataIndex:'title',id:'events_title'},
	{header:'更新時間',dataIndex:'modified',width:120},
	{
		align:'right',
		xtype: 'actioncolumn',
		items: [{
			icon:base_url+'public/images/fam/user_green.gif',
			tooltip:'報名列表',
			handler:function(grid, rowIndex, colIndex) {
				var rec = events_ds.getAt(rowIndex);
				var tmp_id = rec.get('id');
				su_ds.load({params:{n_id:tmp_id}});
				su_win.show();
			}
		}]
	}
]);
var events_grid = new Ext.grid.GridPanel({
	region:'north',
	cm:events_cm,
	store:events_ds,
	title:'活動講座列表',
	height:200,
	autoExpandColumn:'events_title',
	stripeRows:true,
	enableHdMenu:false
});
events_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	events_form.getForm().loadRecord(r);
	events_form.buttons[0].setText('修改');
});
var events_combo = new Ext.form.ComboBox({
	fieldLabel:'類別',
	id:'events_combo',
	store:events_taxo_ds,
	mode:'local',
	hiddenName:'t_id',
	displayField:'name',
	valueField:'id',
	emptyText:'請選擇',
	allowBlank:false
});

var events_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'left',
	title:'活動講座表單',
	labelWidth:40,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id',
		allowBlank:true
	},events_combo,{
		xtype:'textfield',
		fieldLabel:'名稱',
		name:'title',
	},{
		xtype:'ckeditor',
		fieldLabel:'內容',
		name:'content'
	}],
	buttons:[{
		text:'新增',
		handler:function(){
			if(events_form.getForm().isValid()){
				events_form.getForm().submit({
					url:base_url+'admin/events_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						events_form.getForm().reset();
						events_taxo_ds.load();
						events_ds.load();
						events_form.buttons[0].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			events_form.getForm().reset();
			events_form.buttons[0].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = events_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						events_form.getForm().reset();
						events_taxo_ds.load();
						events_ds.load();
						events_form.buttons[0].setText('新增');
					}
				});
			}
		}
	}]
});
var su_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+'admin/su'}),
	root:'root',
	fields:[
		{name:'name',type:'string'},
		{name:'tel',type:'string'},
		{name:'email',type:'string'},
		{name:'created',type:'string'},
	]
});
var su_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'連絡姓名',dataIndex:'name'},
	{header:'連絡電話',dataIndex:'tel'},
	{header:'Email',dataIndex:'email'},
	{header:'報名時間',dataIndex:'created'}
]);
var su_grid = new Ext.grid.GridPanel({
	store:su_ds,
	cm:su_cm,
	title:'報名清單',
	height:400,
	stripeRows:true,
	enableHdMenu:false
});
var su_win = new Ext.Window({
	title:'報名清單列表',
	width:500,
	height:350,
	autoScroll:true,
	frame:true,
	closable:true,
	closeAction:'hide',
	layout:'fit',
	modal:true,
	items:[su_grid]
});
var events = {
	layout:'border',
	id:'events_browser',
	items:[events_taxo_grid,{
		region:'center',
		layout:'border',
		items:[events_grid,events_form]
	}]
};