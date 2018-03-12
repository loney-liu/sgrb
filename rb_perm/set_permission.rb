#!/usr/bin/env ./script/runner
# encoding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'rule_lib.rb' 

_rule_yml = "script/rb/rules.yml"
_permission_group = "artist"
_action="c"

r=RuleBase.new(role:_permission_group, rule_id:491)
r.show_rule()

set_rule=RuleBase.new(role:_permission_group, action:_action)
read_rules = YAML.load_file(_rule_yml)
set_rule.read_rules(read_rules)