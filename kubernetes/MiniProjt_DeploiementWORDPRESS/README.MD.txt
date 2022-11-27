Bonjour,

Vous trouverez ici les manifests yaml que j'ai mis en place pour apporter ma solution pr rapport au projet de deploiement de WORDPRESS.


Mini-Projet:
.Deployez wordpress en suivant les étapes suivantes
  . Crééz un deployment mysql avec un seul replica
  . Créez un service de type ClusterIP pourexposer vos pods mysql
  . Créez un deployment wordpress avec les bonnes varaiables d'envirronnement pour se connecter à la base de données mysql
  . Votre deployment devra stocker les données de wordpress sur un volume monté dans /data de votre noeud
  .Créez un service NodePort pour exposer le frontEnd wordpress.
....


Dans ma solution apportée en plus de ce qui est demandé j'ai egalement rajouter un volume de type hostPath pour rendre persistentes les donnees de ma base de donnée Mysql.
J'ai rajouté un objet secret pour ne pas afficher mes mots de passe en clair.
Pour finir j'ai rajouté un Ingress basique qui fait une redirection vers  mon service NodePort.