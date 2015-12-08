#
# Cookbook Name:: mongodb
# Spec:: default
#
# Copyright (c) 2015 Mohit Sethi<mohit@sethis.in>, All Rights Reserved.

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(:step_into => %w(db mongo_db))
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
