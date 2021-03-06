var faq_taxo_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/taxo_list/9"}),
	root:'root',
	fields:[
		{name:'id',type:'int'},
		{name:'name',type:'string'}
	]
});

var faq_taxo_cm = new Ext.grid.ColumnModel([
	{header:'id',dataIndex:'id',hidden:true},
	{header:'名稱',dataIndex:'name',id:'faq_taxo_name'},
	{
		align:'right',
		xtype: 'actioncolumn',
		items: [{
			icon:base_url+'public/images/fam/delete.gif',
			tooltip:'刪除此分類',
			handler:function(grid, rowIndex, colIndex) {
				var rec = faq_taxo_ds.getAt(rowIndex);
				var tmp_id = rec.get('id');
				Ext.Msg.confirm('訊息','確定刪除此分類？ 相關的資料將會變成未分類狀態',function(btn){
					if(btn === 'yes'){
						Ext.Ajax.request({
							url:base_url+'admin/taxo_delete',
							params:'id='+tmp_id,
							success:function(){
								show_Growl(1,'訊息','刪除已完成');
								faq_form.getForm().reset();
								faq_taxo_ds.load();
								faq_ds.load();
								faq_form.buttons[0].setText('新增');
							}
						});
					}
				});
			}
		}]
	}
]);
var faq_taxo_grid = new Ext.grid.GridPanel({
	collapsible:true,
	region:'west',
	title:'分類列表',
	width:200,
	autoExpandColumn:'faq_taxo_name',
	viewConfig:{forceFit:true},
	cm:faq_taxo_cm,
	store:faq_taxo_ds,
	enableHdMenu:false,
	stripeRows:true
});

var faq_ds = new Ext.data.JsonStore({
	proxy:new Ext.data.HttpProxy({method:'post',url:base_url+"admin/faq"}),
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

var faq_cm = new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'id',dataIndex:'id',hidden:true},
	{header:'類別',dataIndex:'tname'},
	{header:'標題',dataIndex:'title',id:'faq_title'},
	{header:'提問時間',dataIndex:'created',width:120},
	{header:'更新時間',dataIndex:'modified',width:120}
]);
var faq_grid = new Ext.grid.GridPanel({
	region:'north',
	cm:faq_cm,
	store:faq_ds,
	title:'我要提問列表',
	height:200,
	autoExpandColumn:'faq_title',
	stripeRows:true,
	enableHdMenu:false
});
faq_grid.on('rowdblclick',function(grid,rowIndex){
	var r = grid.getStore().getAt(rowIndex);
	faq_form.getForm().loadRecord(r);
	faq_form.buttons[0].setText('修改');
});
var faq_combo = new Ext.form.ComboBox({
	fieldLabel:'類別',
	id:'faq_combo',
	store:faq_taxo_ds,
	mode:'local',
	hiddenName:'t_id',
	displayField:'name',
	valueField:'id',
	emptyText:'請選擇',
	allowBlank:false
});

var faq_form = new Ext.form.FormPanel({
	region:'center',
	autoScroll:true,
	labelAlign:'left',
	title:'我要提問表單',
	labelWidth:40,
	frame:true,
	defaults:{anchor:'95%',msgTarget:'side',allowBlank:false},
	items:[{
		xtype:'hidden',
		name:'id',
		allowBlank:true
	},faq_combo,{
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
			if(faq_form.getForm().isValid()){
				faq_form.getForm().submit({
					url:base_url+'admin/faq_save',
					waitMsg:'資料儲存中',
					success:function(){
						show_Growl(1,'訊息','資料已儲存完畢');
						faq_form.getForm().reset();
						faq_taxo_ds.load();
						faq_ds.load();
						faq_form.buttons[0].setText('新增');
					}
				})
			}
		}
	},{
		text:'清除',
		handler:function(){
			faq_form.getForm().reset();
			faq_form.buttons[0].setText('新增');
		}
	},{
		text:'刪除',
		handler:function(){
			var tmp_id = faq_form.getForm().findField('id').getValue();
			if(tmp_id === ''){
				show_Growl(2,'提醒','請先選擇要刪除的資料');
			}else{
				Ext.Ajax.request({
					url:base_url+'admin/nodes_destory',
					params:'foo[]='+tmp_id,
					success:function(){
						show_Growl(1,'訊息','刪除已完成');
						faq_form.getForm().reset();
						faq_taxo_ds.load();
						faq_ds.load();
						faq_form.buttons[0].setText('新增');
					}
				});
			}
		}
	}]
});
var faq = {
	layout:'border',
	id:'faq_browser',
	items:[faq_taxo_grid,{
		region:'center',
		layout:'border',
		items:[faq_grid,faq_form]
	}]
};