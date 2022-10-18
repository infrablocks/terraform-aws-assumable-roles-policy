# frozen_string_literal: true

require 'spec_helper'

describe 'assumable roles policy' do
  subject { iam_policy(policy_name) }

  let(:policy_name) do
    var(role: :root, name: 'policy_name')
  end
  let(:policy_description) do
    var(role: :root, name: 'policy_description')
  end

  let(:policy_arn) do
    output(role: :root, name: 'policy_arn')
  end
  let(:target_role_arn) do
    output(role: :root, name: 'target_role_arn')
  end

  let(:test_role_1_arn) do
    output(role: :prerequisites, name: 'test_role_1_arn')
  end
  let(:test_role_2_arn) do
    output(role: :prerequisites, name: 'test_role_2_arn')
  end
  let(:test_role_3_arn) do
    output(role: :prerequisites, name: 'test_role_3_arn')
  end

  let(:assumable_roles) do
    [test_role_1_arn, test_role_2_arn, test_role_3_arn]
  end

  let(:target_role) do
    iam_role(target_role_arn)
  end

  it { is_expected.to exist }
  its(:arn) { is_expected.to eq(policy_arn) }

  it 'allows all assumable roles to be assumed' do
    assumable_roles.each do |role|
      expect(target_role)
        .to(be_allowed_action('sts:AssumeRole')
          .resource_arn(role))
    end
  end
end
