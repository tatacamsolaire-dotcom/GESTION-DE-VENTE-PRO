
class I18n{final String lang; I18n(this.lang); static const _fr={'dashboard':'Tableau de bord','products':'Gestion des produits','sale':'Vente & Facturation','history':'Historique des ventes'}; String t(String k){return _fr[k]??k;}}
