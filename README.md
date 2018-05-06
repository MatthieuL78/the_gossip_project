# the_gossip_project

Version amélioré du premier CRUD réalisé (gossip_db). Comprend les models users, gossips et comments. On utilise la gem Devise pour gérer les utilisateurs. On peut créer et commenter des gossips poster par les utilisateurs.

## Lancer le projet
Pour lancer le projet, sur le terminal (dans le dossier concerne) :
```
bundle install --without production
```

```
rails db:migrate
```

```
rails s
```

Vous pouvez observer les pages dans 'localhost:3000'

Vous pouvez voir le projet sur heroku : 

* https://ancient-harbor-48418.herokuapp.com/

## CSS
Le CSS est dans le assets/stylesheets/application.css
