#!/usr/bin/env ./script/runner
# encoding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'set_note_permission.rb'

_permission_group = "artist"
_action="d"

r=RuleBase.new(role:_permission_group, rule_id:491)
r.show_rule()

note=Condition_Update_Note.new(role:_permission_group, action:_action)
#note.rule0()
note.rule1()
note.rule2()