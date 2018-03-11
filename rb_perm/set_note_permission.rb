$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))
require 'rule_lib.rb'

puts "set_note_permission included"
# ca = PermissionRuleSet.find_by_code('artist')
# nrs = PermissionRuleSet.create( :code=>'new_rule_set', :display_name => 'New Rule Set', :entity_type => 'HumanUser')
# nrs.import_rules(PermissionRuleSet.dump_rules('artist'))

# nrs.permission_rules.create(:rule_type=>'update_field_condition', :allow=>'true', :parameter_1=>'Note', :parameter_2=>'addressings_cc', :retrieve_value=>'{"path":"id", "relation":"is_not","values":[0]}')

# nrs.save;
class Condition_Update_Note_CC
	def initialize(role)
		@role = role
	end

	def rule1(act)
		rt = "update_field_condition";
		p1 = "Note";
		p2 = "addressings_cc";
		p3 = "";
		p4 = "";
		allow = "true";
		retrieve_value = '{"path":"id", "relation":"is_not","values":[0]}';
		r=Rule.new(@role, rt, p1, p2, p3, p4, allow, retrieve_value)

		if act == "c"
		  r.create2
		else
			r.destroy2
		end
	end
end


