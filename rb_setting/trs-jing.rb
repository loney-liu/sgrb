#!/usr/bin/env ./script/runner

p = PreferenceSet.find(2);
p.properties["transcoding_on_aws"]="yes";
p.properties["enable_s3_accel"]="no";
p.properties["enable_s3_uploads"]="no";
p.properties["enable_direct_s3_uploads"]="no"; 
p.properties["enable_s3_uploads_from_transcoder"]="no";

p.properties["license"]="xYeIgUOQwbbFF3TUvgbWkEFgFpfj0hOEQ29azdUWgW2veZH7KOZeW12FMDLy \nC2bi";
p.properties["sgtk_install_script_name"]="com_autodesk_sg";
p.properties["sgtk_install_script_key"]="669a90267170faacdf6ab8c647c8e74bc06ed3c545c53109db2da6823ff1baf3";

p.properties["enable_i18n"]="yes"
p.properties["enable_zh_hans_translation"]="yes"
p.properties["enable_zh_hans_translation"]="yes"

p.save;

u = HumanUser.find_by_login('shotgun_admin'); 
u.password_proxy = 'Admin.12345'; 
u.save;
