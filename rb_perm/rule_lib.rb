puts "rule_lib included"

class Rule
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

	def create2()
		_validate = validate2()
		puts _validate
		if _validate == nil
			puts "The rule is not existed. Creating ..."
			@nrs.permission_rules.create(:rule_type=>@rule_type, :allow=>@allow, :parameter_1=>@parameter_1, :parameter_2=>@parameter_2, :parameter_3=>@parameter_3, :parameter_4=>@parameter_4, :retrieve_value=>@retrieve_value)
			@nrs.save
		else
			puts "The rule #{_validate} is existed."
		end
		validate2()
	end
  
  def create3()
		_validate = validate3()
		puts _validate
		if _validate == nil
			puts "The rule is not existed. Creating ..."
			@nrs.permission_rules.create(:rule_type=>@rule_type, :allow=>@allow, :parameter_1=>@parameter_1, :parameter_2=>@parameter_2, :parameter_3=>@parameter_3, :parameter_4=>@parameter_4, :retrieve_value=>@retrieve_value)
			@nrs.save
		else
			puts "The rule #{_validate} is existed."
		end
		validate3()
	end

	def create4()
		_validate = validate4()
		puts _validate
		if _validate == nil
			puts "The rule is not existed. Creating ..."
			@nrs.permission_rules.create(:rule_type=>@rule_type, :allow=>@allow, :parameter_1=>@parameter_1, :parameter_2=>@parameter_2, :parameter_3=>@parameter_3, :parameter_4=>@parameter_4, :retrieve_value=>@retrieve_value)
			@nrs.save
		else
			puts "The rule #{_validate} is existed."
		end
		validate4()
	end

	def destroy2()
		_validate_id = validate2()
		if _validate_id != nil
			puts "Delete #{_validate_id}"
			@nrs.permission_rules.destroy(_validate_id)
		else
			puts "The rule is not existed."
		end
	end

	def destroy3()
		_validate_id = validate3()
		if _validate_id != nil
			puts "Delete #{_validate_id}"
			@nrs.permission_rules.destroy(_validate_id)
		else
			puts "The rule is not existed."
		end
	end

	def destroy4()
		_validate_id = validate4()
		if _validate_id != nil
			puts "Delete #{_validate_id}"
			@nrs.permission_rules.destroy(_validate_id)
		else
			puts "The rule is not existed."
		end
	end

	def validate2()
		puts "Validating if the rule exist ..."
		@nrs.permission_rules.each do |r|
			if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2
			  puts r.attributes["id"]
			  puts r.attributes["parameter_1"]
			  puts r.attributes["parameter_2"]
				puts r.attributes["allow"]
				puts r.attributes["retrieve_value"]
				return r.attributes["id"]
			end
		end
		return nil
	end

	def validate3()
		puts "Validating if the rule exist ..."
		@nrs.permission_rules.each do |r|
			if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2 && r.attributes["parameter_3"] == @parameter_3
			  puts r.attributes["id"]
			  puts r.attributes["parameter_1"]
			  puts r.attributes["parameter_2"]
			  puts r.attributes["parameter_3"]
				puts r.attributes["allow"]
				puts r.attributes["retrieve_value"]
				return r.attributes["id"]
			end
		end
		return nil
	end

	def validate4()
		puts "Validating if the rule exist ..."
		@nrs.permission_rules.each do |r|
			if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2 && r.attributes["parameter_3"] == @parameter_3 && r.attributes["parameter_4"] == @parameter_4
			  puts r.attributes["id"]
			  puts r.attributes["parameter_1"]
			  puts r.attributes["parameter_2"]
			  puts r.attributes["parameter_3"]
			  puts r.attributes["parameter_4"]
				puts r.attributes["allow"]
				puts r.attributes["retrieve_value"]
				return r.attributes["id"]
			end
		end
		return nil
	end
end