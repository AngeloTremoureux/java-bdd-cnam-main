## Projet Java & Bdd - CNAM
### 1. Clonage du dépôt Git
clone du dépot :  
```bash
git clone https://github.com/AngeloTremoureux/java-bdd-cnam-main.git
```
Clone du dépôt avec sous modules :  
```bash
git clone --recurse-submodules https://github.com/AngeloTremoureux/java-bdd-cnam-main.git
```
### 2. Lancement des containers Docker avec bon sous modules
```bash
make init-projet-java #Clone du projet en java
make init-projet-php #Clone du projet en PHP
```
