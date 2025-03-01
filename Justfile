
default:
  @just --list

# Used to create_key
create_key:
  git-crypt export-key ./secret-key
  cat ./secret-key | base64 > ./secret-key-base64

# Unlock gitcrypt
unlock KEY:
  base64 --decode {{KEY}} > ./secret-key
  git-crypt unlock ./secret-key
