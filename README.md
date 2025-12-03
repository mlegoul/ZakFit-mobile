# ZakFit – Frontend iOS (SwiftUI)

**ZakFit** est une application mobile iOS dédiée au suivi des activités physiques et des objectifs santé. Ce dépôt contient le code source du **frontend**, développé en **SwiftUI**, qui interagit avec une **API backend** (Vapor + MariaDB).

---

## 📌 Fonctionnalités principales
- **Suivi des activités physiques** : Course, durée, calories brûlées, date.
- **Objectifs personnalisés** : Cibles caloriques, durée d’activité, fréquence (stockés en JSON dans la base de données).
- **Affichage des données** : Récupération et visualisation des activités via un endpoint API dédié.
- **Intégration future** : Navigation intérieure ou réalité augmentée (LiDAR/iPhone 17 Pro).

---

## 🛠 Prérequis
- **Xcode 15+** (pour supporter SwiftUI et iOS 17+).
- **Swift 5.9+**.
- **CocoaPods** (si des dépendances tierces sont utilisées).
- **Accès à l’API backend** (Vapor) : Assurez-vous que le backend est déployé et accessible.

---

## 🚀 Installation

1. **Cloner le dépôt** :
   ```bash
   git clone [URL_DU_DÉPÔT]
   cd zakfit-ios
