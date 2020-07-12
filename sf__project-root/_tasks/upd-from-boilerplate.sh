#!/usr/bin/bash

# cambiare nome se mpdificato per evitare che sia sovrascritto

source ./upd-from-boilerplate-params.sh

ASSETS_DIR="$project_base_dir"/public/assets
NODE_MOD_DIR="$ASSETS_DIR"/node_modules
TEMPLATES_DIR="$project_base_dir"/templates


# symfony form theme
FILE=bs4_form_layout.html.twig
SOURCE="$NODE_MOD_DIR"/symfony-bootstrap-form-theme/dist/"$FILE"
TARGET="$TEMPLATES_DIR"/_shared/"$FILE"
if [ -f "$TARGET" ]; then
  cp "$SOURCE" "$TARGET"
else
  echo "No bs4_form_layout"
fi


# layout_tools
SOURCE="$NODE_MOD_DIR"/m-layout-tools/dist/
TARGET=$ASSETS_DIR/layout-tools/
if [ -d $TARGET ]; then
  cp -a "$SOURCE". "$TARGET"
else
  echo "No layout-tools"
fi


# ckeditor
SOURCE="$NODE_MOD_DIR"/m-utilities/ckeditor/ckeditor-dist/
TARGET=$ASSETS_DIR/ckeditor/
if [ -d $TARGET ]; then
  cp -a "$SOURCE". "$TARGET"
else
  echo "No ckeditor"
fi


# contenuti
SOURCE="$boilerplate_path"/sf__project-root/__app-root/templates/backoffice/contenuti/
TARGET=$TEMPLATES_DIR/backoffice/contenuti/
if [ -d $TARGET ]; then
  cp -a "$SOURCE". "$TARGET"
else
  echo "No contenuti"
fi

#shared
SHARED_DIR_FILES=(
  meta.html.twig
  imgs.html.twig
  imgs_viewer.html.twig
  icone.html.twig
  google_font_v2_loader.html.twig
  google_font_loader.html.twig
  form_end_sf5.html.twig
  form_end_sf4.html.twig
  flash_messages.html.twig
  flash_messages_malert.html.twig
  file_uploader.html.twig
  fancybox_cdn.html.twig
  analytics.html.twig
)
for i in "${SHARED_DIR_FILES[@]}"
do
  SOURCE="$boilerplate_path"/sf__project-root/__app-root/templates/_shared/"$i"
  TARGET="$TEMPLATES_DIR"/_shared/"$i"
  if [ -f "$TARGET" ]; then
    cp "$SOURCE" "$TARGET"
  else
    echo "No $i"
  fi
done

read -e -p "Aggiorno anche questo script [s/N]?" SN # -i "N"

if [ -z "$SN" ] 
then
  SN="N"
fi
if [ $SN == "s" ] || [ $SN == "S" ]
then
  cp "$boilerplate_path"/sf__project-root/_tasks/upd-from-boilerplate.sh "$PWD"
fi

echo END