require 'yaml'

puts "rule_lib inc=beginluded"

class RuleBase
	def initialize(para={})
		puts
		puts "Rule base init ..."
		puts
		@role = para[:role]
		@act = para[:action]
		@rule_id = para[:rule_id]

		@nrs = PermissionRuleSet.find_by_code(para[:role])
	    @rule_type=nil
	    @parameter_1=nil
	    @parameter_2=nil
	    @parameter_3=nil
	    @parameter_4=nil
	    @allow=nil
	    @retrieve_value=nil
	end

	def read_rules(rules)
		rules['rules'].each_with_index do |sub_rules, index|
			sub_rules.each_with_index do |rs, i|
				if !rs.instance_of?(String)
					rs.each do |r|
						if !r.instance_of?(String)
							r.each do |m|
								if !m.instance_of?(String)
								    @rule_type = m["rule_type"]
									@parameter_1 = m["parameter_1"] == '' ? nil : m["parameter_1"]
									@parameter_2 = m["parameter_2"] == '' ? nil : m["parameter_2"]
									@parameter_3 = m["parameter_3"] == '' ? nil : m["parameter_3"]
									@parameter_4 = m["parameter_4"] == '' ? nil : m["parameter_4"]
									@allow = m["allow"];
									@retrieve_value = m["retrieve_value"]== '' ? nil : m["retrieve_value"]
									
									if @act == "c"
									  create
									else
									  destroy
									end
								end
							end
						end
					end
				end
			end
		end
	end

	def show_rule()
		@nrs.permission_rules.each do |r|
			if r.attributes["id"] == @rule_id
				puts "Detail of the rule"
				show_para(r)
			end
		end
		puts
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
		puts
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
		puts
	end

	def validate()
		puts "Validating if the rule exist ..."
		@nrs.permission_rules.each do |r|
			if @parameter_2 == nil && @parameter_3 == nil && @parameter_4 == nil
				if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1
				  show_para(r)
				  return r.attributes["id"]
				end
			elsif @parameter_3 == nil && @parameter_4 == nil
				if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2
				  show_para(r)
				  return r.attributes["id"]
				end
			elsif @parameter_3 == nil
				if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2 && r.attributes["parameter_3"] == @parameter_3
				  show_para(r)
				  return r.attributes["id"]
				end
			else
				if r.attributes["rule_type"] == @rule_type && r.attributes["parameter_1"] == @parameter_1 && r.attributes["parameter_2"] == @parameter_2 && r.attributes["parameter_3"] == @parameter_3 && r.attributes["parameter_4"] == @parameter_4
				  show_para(r)
				  return r.attributes["id"]
				end
			end
		end
		puts "Can't find the rule."
		return nil
	end

	def show_para(r)
		puts "Rule ID: #{r.attributes["id"]}"
		show_detail(para_name:"parameter_1", para_value:r.attributes["parameter_1"])
		show_detail(para_name:"parameter_2", para_value:r.attributes["parameter_2"])
		show_detail(para_name:"parameter_3", para_value:r.attributes["parameter_3"])
		show_detail(para_name:"parameter_4", para_value:r.attributes["parameter_4"])
		show_detail(para_name:"Allow", para_value:r.attributes["allow"])
		show_detail(para_name:"Retrieve Value", para_value:r.attributes["retrieve_value"])
	end

	def show_detail(settings={})
		para_name=settings[:para_name]
		para_value=settings[:para_value]

		if para_value == nil
			puts "#{para_name}: nil"
		elsif para_value == ""
			puts "#{para_name}: "
		else
			puts "#{para_name}: #{para_value}"
		end
	end
end
