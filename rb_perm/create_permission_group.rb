#!/usr/bin/env ./script/runner
# encoding: utf-8

ca = PermissionRuleSet.find_by_code('artist')
nrs = PermissionRuleSet.create( :code=>'new_rule_set', :display_name => 'New Rule Set', :entity_type => 'HumanUser')
nrs.import_rules(PermissionRuleSet.dump_rules('artist'))

# nrs.permission_rules.create(:rule_type=>'update_field_condition', :allow=>'true', :parameter_1=>'Note', :parameter_2=>'addressings_cc', :retrieve_value=>'{"path":"id", "relation":"is_not","values":[0]}')

nrs.save;