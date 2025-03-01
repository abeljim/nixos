
default:
  @just --list

# Used to create_key gitcrypt
create_key:
  git-crypt export-key ./secret-key
  cat ./secret-key | base64 > ./secret-key-base64

# Decode Key
unlock_base64 KEY:
  echo {{KEY}} | base64 --decode > ./secret-key

# Unlock gitcrypt
unlock:
  git-crypt unlock ./secret-key
