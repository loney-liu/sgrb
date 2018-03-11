puts "rule_lib included"

class RuleBase
	def initialize(role)
		"Rule base init ..."
		@role = role
	end

	def show_rule(rule_id)
		nrs = PermissionRuleSet.find_by_code(@role)
		nrs.permission_rules.each do |r|
			if r.attributes["id"] == rule_id
				puts "Rule ID: #{r.attributes["id"]}"
				puts "Parameter_1: #{r.attributes["parameter_1"]}"
				puts "Parameter_2: #{r.attributes["parameter_2"]}"
				puts "Parameter_3: #{r.attributes["parameter_3"]}"
				puts "Parameter_4: #{r.attributes["parameter_4"]}"
				puts "Allow: #{r.attributes["allow"]}"
				puts "Retrieve Value: #{r.attributes["retrieve_value"]}"
			end
		end
	end
end

class RuleRule < RuleBase
	def run_rule2(rt, p1, p2, p3, p4, allow, retrieve_value, act)
		r=Rule2.new(@role, rt, p1, p2, p3, p4, allow, retrieve_value)
		if act == "c"
		  r.create
		else
		  r.destroy
		end
	end
	def run_rule3(rt, p1, p2, p3, p4, allow, retrieve_value, act)
		r=Rule3.new(@role, rt, p1, p2, p3, p4, allow, retrieve_value)
		if act == "c"
		  r.create
		else
		  r.destroy
		end
	end
	def run_rule4(rt, p1, p2, p3, p4, allow, retrieve_value, act)
		r=Rule4.new(@role, rt, p1, p2, p3, p4, allow, retrieve_value)
		if act == "c"
		  r.create
		else
		  r.destroy
		end
	end
end

class RuleAction
	def initialize(role, rule_type, parameter_1, parameter_2, parameter_3, parameter_4, allow, retrieve_value)
		@nrs = PermissionRuleSet.find_by_code(role)
	    @rule_type=rule_type
	    @parameter_1=parameter_1
	    @parameter_2=parameter_2
	    @parameter_3=parameter_3
	    @parameter_4=parameter_4
	    @allow=allow
	    @retrieve_value=retrieve_value
	end 

	def create()
		rule_id = validate()
		if rule_id == nil
			puts "The rule is not existed. Creating ..."
			rule = @nrs.permission_rules.create(:rule_type=>@rule_type, :allow=>@allow, :parameter_1=>@parameter_1, :parameter_2=>@parameter_2, :parameter_3=>@parameter_3, :parameter_4=>@parameter_4, :retrieve_value=>@retrieve_value)
			@nrs.save
			puts rule
			puts "Rule is created."
		else
			puts "The rule #{rule_id} is existed."
		end
	end

	def destroy()
		rule_id = validate()
		if rule_id != nil
			puts "Delete #{rule_id}"
			@nrs.permission_rules.destroy(rule_id)
			@nrs.save
		else
			puts "The rule is not existed."
		end
	end

	def validate()
		puts "Validating if the rule exist ..."
	end

	def show_para(r)
		puts "Rule ID: #{r.attributes["id"]}"
		puts "Parameter_1: #{r.attributes["parameter_1"]}"
		puts "Parameter_2: #{r.attributes["parameter_2"]}"
		puts "Parameter_3: #{r.attributes["parameter_3"]}"
		puts "Parameter_4: #{r.attributes["parameter_4"]}"
		puts "Allow: #{r.attributes["allow"]}"
		puts "Retrieve Value: #{r.attributes["retrieve_value"]}"
	end
end

class Rule2 < RuleAction
	def validate()
		super()
		@nrs.permission_rules.each do |r|
			if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2
			  show_para(r)
			  return r.attributes["id"]
			end
		end
		puts "Can't find the rule."
		return nil
	end
end


class Rule3 < RuleAction
	def validate()
		super()
		@nrs.permission_rules.each do |r|
			if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2 && r.attributes["parameter_3"] == @parameter_3
			  show_para(r)
			  return r.attributes["id"]
			end
		end
		puts "Can't find the rule."
		return nil
	end
end

class Rule4 < RuleAction
	def validate()
		super()
		@nrs.permission_rules.each do |r|
			if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2 && r.attributes["parameter_3"] == @parameter_3 && r.attributes["parameter_4"] == @parameter_4
			  show_para(r)
			  return r.attributes["id"]
			end
		end
		puts "Can't find the rule."
		return nil
	end
end
