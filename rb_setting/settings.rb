#!/usr/bin/env ./script/runner
$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require "set_lib.rb"

settings = {
	"password"=>'Admin.12345',
	"license" => "xYeIgUOQwbbFF3TUvgbWkEFgFpfj0hOEQ29azdUWgW2veZH7KOZeW12FMDLy \nC2bi", 
	"api_script" => "com_autodesk_sg", 
	"api_key" => "669a90267170faacdf6ab8c647c8e74bc06ed3c545c53109db2da6823ff1baf3"
}

p = Pref.new(password:settings["password"], license:settings["license"], api_script:settings["api_script"], api_key:settings["api_key"])
p.setup
