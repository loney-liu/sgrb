#!/usr/bin/env ./script/runner
# encoding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'set_note_permission.rb'

_role = "new_rule_set"

note=Condition_Update_Note_CC.new(_role)
note.rule1("c")