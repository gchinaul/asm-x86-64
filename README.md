Assembleur x86-64

# 🚀 LIBASM - Assembly Library Project

## 📋 Description

Ce projet consiste à réécrire des fonctions de la libc en assembleur x86-64. C'est un excellent exercice pour comprendre le fonctionnement bas niveau des programmes et maîtriser l'assembleur.

## 📁 Structure du projet

```
libasm/
├── Makefile                    # Fichier de compilation
├── libasm.h                   # Header avec prototypes
├── main.c                     # Programme de test
├── test.sh                    # Script de test automatisé
├── README.md                  # Ce fichier
├── ft_strlen.s               # strlen en assembleur
├── ft_strcpy.s               # strcpy en assembleur
├── ft_strcmp.s               # strcmp en assembleur
├── ft_write.s                # write en assembleur
├── ft_read.s                 # read en assembleur
├── ft_strdup.s               # strdup en assembleur
└── bonus/
    ├── ft_atoi_base_bonus.s          # atoi_base en assembleur
    ├── ft_list_push_front_bonus.s    # list_push_front en assembleur
    ├── ft_list_size_bonus.s          # list_size en assembleur
    ├── ft_list_sort_bonus.s          # list_sort en assembleur
    └── ft_list_remove_if_bonus.s     # list_remove_if en assembleur
```

## 🛠️ Compilation

### Prérequis
- **nasm** (Netwide Assembler)
- **gcc** 
- **make**

```bash
# Ubuntu/Debian
sudo apt-get install nasm gcc make

# macOS
brew install nasm
```

### Commandes de compilation

```bash
# Compiler la partie obligatoire
make

# Compiler avec les bonus
make bonus

# Compiler et tester
make test

# Nettoyer
make clean      # Supprime les .o
make fclean     # Supprime tout
make re         # Recompile tout
```

### Script de test automatisé
```bash
chmod +x test.sh
./test.sh
```

## 📚 Fonctions implémentées

### Partie obligatoire
- **ft_strlen** : Calcule la longueur d'une chaîne
- **ft_strcpy** : Copie une chaîne dans une autre
- **ft_strcmp** : Compare deux chaînes
- **ft_write** : Écrit dans un descripteur de fichier
- **ft_read** : Lit depuis un descripteur de fichier  
- **ft_strdup** : Duplique une chaîne (avec malloc)

### Partie bonus
- **ft_atoi_base** : Convertit une chaîne en nombre dans une base donnée
- **ft_list_push_front** : Ajoute un élément en tête de liste
- **ft_list_size** : Retourne la taille d'une liste
- **ft_list_sort** : Trie une liste chaînée
- **ft_list_remove_if** : Supprime les éléments correspondant à un critère

## 🎓 Concepts assembleur utilisés

### Registres x86-64
- **rax** : Valeur de retour, registre accumulateur
- **rdi** : Premier argument (selon System V ABI)
- **rsi** : Deuxième argument
- **rdx** : Troisième argument
- **rcx** : Quatrième argument (registre compteur)
- **rbx** : Registre de base (préservé)
- **rsp** : Pointeur de pile

### Instructions principales
- **mov** : Déplacement de données
- **cmp** : Comparaison
- **jmp/je/jne/jl/jg** : Sauts conditionnels/inconditionnels
- **inc/dec** : Incrémentation/décrémentation
- **push/pop** : Manipulation de la pile
- **syscall** : Appel système
- **ret** : Retour de fonction

### Gestion des erreurs
- **errno** : Variable globale d'erreur
- **__errno_location** : Fonction pour obtenir l'adresse d'errno
- Vérification des valeurs de retour des syscalls

## 🔍 Explications détaillées

### ft_strlen
```nasm
; Utilise un compteur dans rax
; Parcourt la chaîne caractère par caractère
; S'arrête quand il trouve '\0'
xor rax, rax        ; Initialise compteur à 0
cmp byte [rdi + rax], 0  ; Compare avec '\0'
```

### ft_write/ft_read
```nasm
; Utilise les syscalls Linux
mov rax, 1      ; Numéro syscall pour write (1)
mov rax, 0      ; Numéro syscall pour read (0)  
syscall         ; Appel système
```

### Gestion des listes chaînées
```c
typedef struct s_list {
    void *data;           // 8 bytes
    struct s_list *next;  // 8 bytes  
} t_list;                 // Total: 16 bytes
```

## 🧪 Tests

Le programme de test vérifie :
- ✅ Fonctionnement normal
- ✅ Cas limites (chaînes vides, NULL)  
- ✅ Gestion d'erreurs
- ✅ Comparaison avec fonctions standards
- ✅ Gestion mémoire (pour strdup et listes)

## 📖 Ressources utiles

- [Intel Software Developer Manual](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)
- [System V ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)
- [Linux Syscall Table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
- [NASM Documentation](https://nasm.us/docs.php)

## 🏆 Objectifs pédagogiques

Ce projet permet d'apprendre :
- 🎯 Architecture x86-64
- 🎯 Conventions d'appel système
- 🎯 Gestion bas niveau de la mémoire
- 🎯 Optimisation du code
- 🎯 Débogage assembleur
- 🎯 Interaction entre C et assembleur

## 🚨 Points d'attention

- ⚠️ Respect de la calling convention System V
- ⚠️ Gestion correcte d'errno pour les syscalls
- ⚠️ Pas d'assembleur inline, fichiers .s obligatoires
- ⚠️ Utilisation de la syntaxe Intel (pas AT&T)
- ⚠️ Compilation 64-bit uniquement
- ⚠️ Flag -no-pie interdit

---
*Projet réalisé dans le cadre du cursus 42* 🎓
