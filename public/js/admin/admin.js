var tp;
Ext.onReady(function(){
	Ext.QuickTips.init();
	Ext.override(Ext.data.Store, {
		storeOptions : function(o) {
			o = Ext.apply({}, o);
			if(o.params){
				o.params = Ext.apply({}, o.params);
			}
			delete o.callback;
			delete o.scope;
			this.lastOptions = o;
		}
	});
	
	login_win.show();
	tp = new Ext.TabPanel({
		region:'center',
		closable:true,
		autoDestroy:false,
		defaults:{
			layout:'fit',
			autoScroll:true
		}
	});

	var vp = new Ext.Viewport({
		layout:'border',
		items:[{
			region:'north',
			height:80,
			html:'<h1><img src="'+base_url+'public/images/admin/logo.jpg"></h1>'
		},tree,tp]
	});
});
function show_Growl(type,title,string){
	if(type == 1){
		Ext.ux.Growl.notify({
			title: title, 
			message: string,
			iconCls:'x-growl-notice',
			alignment: "tr-tr",
			offset: [-10, 10]
		});
	}else{
		Ext.ux.Growl.notify({
			title: title, 
			message: string,
			iconCls:'x-growl-error',
			alignment: "tr-tr",
			offset: [-10, 10]
		});
	}
}