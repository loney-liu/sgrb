$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'rule_lib.rb'

puts "set_note_permission included"

class Condition_Update_Note < RuleRule
	def rule0(act)
		rt = "update_field_condition";
		p1 = "Note";
		p2 = nil;
		p3 = "";
		p4 = "";
		allow = "true";
		retrieve_value = '{"path":"user", "relation":"is","values":[{"type":"HumanUser","id":0,"valid":"logged_in_user_token"}]}';
		run_rule2(rt, p1, p2, p3, p4, allow, retrieve_value, act)
	end

	def rule1(act)
		rt = "update_field_condition";
		p1 = "Note";
		p2 = "addressings_to";
		p3 = "";
		p4 = "";
		allow = "true";
		retrieve_value = '{"path":"id", "relation":"is_not","values":[0]}';
		run_rule2(rt, p1, p2, p3, p4, allow, retrieve_value, act)
	end

	def rule2(act)
		rt = "update_field_condition";
		p1 = "Note";
		p2 = "sg_status_list";
		p3 = "cmpt";
		p4 = "";
		allow = "true";
		retrieve_value = '{ "logical_operator": "or", "conditions": [ {"path":"id", "relation":"is_not", "values":[null] } ] }';
		run_rule3(rt, p1, p2, p3, p4, allow, retrieve_value, act)
	end
end


