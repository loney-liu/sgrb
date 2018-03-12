$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'rule_lib.rb'

puts "set_note_permission included"

class Condition_Update_Note < RuleBase
	def rule0()
		@rule_type = "update_field_condition";
		@parameter_1 = "Note";
		@parameter_2 = nil;
		@parameter_3 = nil;
		@parameter_4 = nil;
		@allow = "true";
		@retrieve_value = '{"path":"user", "relation":"is","values":[{"type":"HumanUser","id":0,"valid":"logged_in_user_token"}]}';

		run_rule()
	end

	def rule1()
		@rule_type = "update_field_condition";
		@p1 = "Note";
		@p2 = "addressings_to";
		@p3 = nil;
		@p4 = nil;
		@allow = "true";
		@retrieve_value = '{"path":"id", "relation":"is_not","values":[0]}';

		run_rule()
	end

	def rule2()
		@rule_type = "update_field_condition";
		@parameter_1 = "Note";
		@parameter_2 = "sg_status_list";
		@parameter_3 = "cmpt";
		@parameter_4 = nil;
		@allow = "true";
		@retrieve_value = '{ "logical_operator": "or", "conditions": [ {"path":"id", "relation":"is_not", "values":[null] } ] }';
		
		run_rule()
	end
end


