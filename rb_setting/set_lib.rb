puts "set_lib loaded"

class Pref
	def initialize(settings={})
		@p = PreferenceSet.find(2);
		@password = settings[:password]
		@license = settings[:license]
		@api_script = settings[:api_script]
		@api_key = settings[:api_key]
	end

	def set_transcoding()
		@p.properties["transcoding_on_aws"]="yes";
		@p.properties["enable_s3_accel"]="no";
		@p.properties["enable_s3_uploads"]="no";
		@p.properties["enable_direct_s3_uploads"]="no"; 
		@p.properties["enable_s3_uploads_from_transcoder"]="no";
		@p.save;
		puts "Transcoding done."
	end

	def set_language()
		@p.properties["enable_i18n"]="yes"
		@p.properties["enable_zh_hans_translation"]="yes"
		@p.properties["enable_zh_hans_translation"]="yes"
		@p.save;
		puts "Language done."
	end

	def set_license()
		@p.properties["license"] = @license;
		@p.save
		puts "Licese done."
	end

	def set_api_license()
		@p.properties["sgtk_install_script_name"]=@api_script;
		@p.properties["sgtk_install_script_key"]=@api_key;
		@p.save

		puts "API Key done."
	end

	def reset_password()
		u = HumanUser.find_by_login('shotgun_admin'); 
		u.password_proxy = @password
		u.save;

		puts "Shotgun_Admin password set #{@password}."
	end

	def setup()
		set_license
		set_api_license
		set_transcoding
		set_language
		reset_password
	end
end







