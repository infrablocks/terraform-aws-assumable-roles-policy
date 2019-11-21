require 'spec_helper'

describe 'assumable roles policy' do
  let(:policy_name) { vars.policy_name }
  let(:policy_description) { vars.policy_description }
  let(:policy_arn) { output_for(:harness, 'policy_arn') }

  let(:target_role_arn) { output_for(:harness, 'target_role_arn') }

  let(:test_role_1_arn) { output_for(:prerequisites, 'test_role_1_arn') }
  let(:test_role_2_arn) { output_for(:prerequisites, 'test_role_2_arn') }
  let(:test_role_3_arn) { output_for(:prerequisites, 'test_role_3_arn') }

  let(:assumable_roles) {
    [test_role_1_arn, test_role_2_arn, test_role_3_arn]
  }

  subject {
    iam_policy(policy_name)
  }

  it { should exist }
  its(:arn) { should eq(policy_arn) }

  let(:target_role) {
    iam_role(target_role_arn)
  }

  it 'should allow all assumable roles to be assumed' do
    assumable_roles.each do |role|
      expect(target_role)
          .to(be_allowed_action('sts:AssumeRole')
              .resource_arn(role))
    end
  end
end
