var knowledge_taxo_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/taxo_list/2"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'name',type:'string'}
	]
});

var knowledge_taxo_cm = new Ext.grid.ColumnModel([
	{header:'id',dataIndex:'id',hidden:true},
	{header:'名稱',dataIndex:'name',id:'knowledge_taxo_name'},
	{
		align:'right',
		xtype: 'actioncolumn',
		items: [{
			icon:base_url+'public/images/fam/delete.gif',
			tooltip:'刪除此分類',
			handler:function(grid, rowIndex, colIndex) {
				var rec = knowledge_taxo_ds.getAt(rowIndex);
				var tmp_id = rec.get('id');
				Ext.Msg.confirm('訊息','確定刪除此分類？ 相關的資料將會變成未分類狀態',function(btn){
					if(btn === 'yes'){
						Ext.Ajax.request({
							url:base_url+'admin/taxo_delete',
							params:'id='+tmp_id,
							success:function(){
								show_Growl(1,'訊息','刪除已完成');
								knowledge_form.getForm().reset();
								knowledge_taxo_ds.load();
								knowledge_ds.load();
								knowledge_form.buttons[0].setText('新增');
							}
						});
					}
				});
			}
		}]
	}
]);
var knowledge_taxo_grid = new Ext.grid.GridPanel({
	collapsible:true,
	region:'west',
	title:'分類列表',
	width:200,
	autoExpandColumn:'knowledge_taxo_name',
	viewConfig:{forceFit:true},
	cm:knowledge_taxo_cm,
	store:knowledge_taxo_ds,
	enableHdMenu:false,
	stripeRows:true
});

var knowledge_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/knowledge"}),
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

var knowledge_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'id',dataIndex:'id',hidden:true},
	{header:'類別',dataIndex:'tname'},
	{header:'標題',dataIndex:'title',id:'knowledge_title'},
	{header:'更新時間',dataIndex:'modified',width:120}
]);
var knowledge_grid = new Ext.grid.GridPanel({
	region:'north',
	cm:knowledge_cm,
	store:knowledge_ds,
	title:'樹木知識列表',
	height:200,
	autoExpandColumn:'knowledge_title',
	stripeRows:true,
	enableHdMenu:false
});
knowledge_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	knowledge_form.getForm().loadRecord(r);
	knowledge_form.buttons[0].setText('修改');
});
var knowledge_combo = new Ext.form.ComboBox({
	fieldLabel:'類別',
	id:'knowledge_combo',
	store:knowledge_taxo_ds,
	mode:'local',
	hiddenName:'t_id',
	displayField:'name',
	valueField:'id',
	emptyText:'請選擇',
	allowBlank:false
});

var knowledge_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'left',
	title:'樹木知識表單',
	labelWidth:40,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id',
		allowBlank:true
	},knowledge_combo,{
		xtype:'textfield',
		fieldLabel:'標題',
		name:'title',
	},{
		xtype:'ckeditor',
		fieldLabel:'內容',
		name:'content'
	}],
	buttons:[{
		text:'新增',
		handler:function(){
			if(knowledge_form.getForm().isValid()){
				knowledge_form.getForm().submit({
					url:base_url+'admin/knowledge_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						knowledge_form.getForm().reset();
						knowledge_taxo_ds.load();
						knowledge_ds.load();
						knowledge_form.buttons[0].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			knowledge_form.getForm().reset();
			knowledge_form.buttons[0].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = knowledge_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						knowledge_form.getForm().reset();
						knowledge_taxo_ds.load();
						knowledge_ds.load();
						knowledge_form.buttons[0].setText('新增');
					}
				});
			}
		}
	}]
});
var knowledge = {
	layout:'border',
	id:'knowledge_browser',
	items:[knowledge_taxo_grid,{
		region:'center',
		layout:'border',
		items:[knowledge_grid,knowledge_form]
	}]
};