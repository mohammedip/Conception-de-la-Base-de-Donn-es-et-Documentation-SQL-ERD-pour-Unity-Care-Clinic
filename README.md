# Conception-de-la-Base-de-Donn-es-et-Documentation-SQL-ERD-pour-Unity-Care-Clinic
# Unity Care Clinic - Gestion de Base de Données

## Contexte du Projet
Unity Care Clinic vise à offrir une gestion optimale des données hospitalières. Le projet consiste à concevoir une base de données efficace et bien structurée qui répond aux besoins variés d'un système de gestion hospitalière.

## Objectif
L'objectif principal est de concevoir une base de données qui :
- Prend en charge l'ensemble des fonctionnalités de la clinique.
- Assure la gestion efficace des données.
- Offre un système fiable, sécurisé, et évolutif.
- Garantit la qualité des données tout en optimisant les performances.

## Description Fonctionnelle
La base de données est conçue pour :
- Gérer les départements, médecins, patients, chambres, admissions, rendez-vous, médicaments, prescriptions, et le personnel administratif.
- Assurer une gestion fluide et centralisée des informations.
- Proposer des fonctionnalités robustes pour un usage hospitalier quotidien.

## Tables de la Base de Données
Les tables suivantes sont incluses dans le schéma :

### 1. Départements
- **Colonnes principales** : ID, Nom, Description.

### 2. Médecins
- **Colonnes principales** : ID, Nom, Spécialité, Département, Contact.

### 3. Patients
- **Colonnes principales** : ID, Nom, Date de Naissance, Contact, Adresse.

### 4. Chambres
- **Colonnes principales** : ID, Type, Capacité, Statut.

### 5. Admissions
- **Colonnes principales** : ID, Patient, Chambre, Date d'Admission, Date de Sortie.

### 6. Rendez-vous
- **Colonnes principales** : ID, Patient, Médecin, Date, Heure, Statut.

### 7. Médicaments
- **Colonnes principales** : ID, Nom, Description, Stock.

### 8. Prescriptions
- **Colonnes principales** : ID, Patient, Médecin, Médicament, Dosage, Durée.

### 9. Personnel Administratif
- **Colonnes principales** : ID, Nom, Fonction, Contact.

