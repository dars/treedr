var tree = new Ext.tree.TreePanel({
	region:'west',
	id:'left_menu',
	title:'管理選項',
	autoScroll:true,
	width:180,
	slide:true,
	rootVisible:false,
	loadMask:true,
	loader:tree_loader
});
var tree_loader = new Ext.tree.TreeLoader();
var root = new Ext.tree.AsyncTreeNode({
	id:'tree_menu',
	text:'分類清單',
	children:[{
		id:'info',
		text:'文字簡介',
		expanded:true,
		children:[{
			id:'aboutus',
			text:'關於我們',
			leaf:true
		},{
			id:'relevant',
			text:'相關規定法令',
			leaf:true
		}]
	},{
		id:'news',
		text:'最新消息',
		leaf:true
	},{
		id:'service',
		text:'服務項目',
		leaf:true
	},{
		id:'defending',
		text:'樹木醫生',
		leaf:true
	},{
		id:'reference',
		text:'專案展示',
		leaf:true
	},{
		id:'event',
		text:'活動講座',
		leaf:true
	},{
		id:'knowledge',
		text:'樹木知識',
		leaf:true
	},{
		id:'faq',
		text:'我要提問',
		leaf:true
	},{
		id:'hyperlinks',
		text:'友善連結',
		leaf:true
	}]
});
tree.setRootNode(root);

tree.on('click',function(node){
	var id = node.id;
	switch(id){
		case 'aboutus':
			var ti = tp.getItem('aboutus');
			if(typeof ti === 'undefined'){
				ti = tp.add({
					title:node.text,
					id:'aboutus',
					items:[au_form]
				});
			}
			au_ds.load();
			tp.activate('aboutus');
			break;
		case 'relevant':
			var ti = tp.getItem('relevant');
			if(typeof ti === 'undefined'){
				ti = tp.add({
					title:node.text,
					id:'relevant',
					items:[rv_form]
				});
			}
			rv_ds.load();
			tp.activate('relevant');
			break;
			
	}
});