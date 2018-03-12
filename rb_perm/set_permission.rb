#!/usr/bin/env ./script/runner
# encoding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'rule_lib.rb' 

yml_file = 'rules.yml'
yml_path = File.join(File.dirname(File.expand_path(__FILE__)), yml_file)

r=RuleBase.new(yml:yml_path, rule_id:491)
r.show_rule()

rule=RuleBase.new(yml:yml_path)
rule.set_rules()