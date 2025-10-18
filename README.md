Asm x86-64

- [Intel Software Developer Manual](https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html)
- [System V ABI](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)
- [Linux Syscall Table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
- [NASM Documentation](https://nasm.us/docs.php)

### Prérequis
- **nasm** (Netwide Assembler)
- **gcc** 
- **make**

```bash
# Ubuntu/Debian
sudo apt-get install nasm gcc make

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
