#!/usr/bin/env ./script/runner
# encoding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'set_note_permission.rb'

_permission_group = "new_rule_set"

#r=RuleBase.new(_permission_group)
#r.show_rule(1289)

_action="c"
note=Condition_Update_Note.new(_permission_group)
#note.rule0(_action)
#note.rule1(_action)
#note.rule2(_action)