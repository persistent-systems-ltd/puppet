#!/usr/bin/env ruby
#
#  Created by Luke Kanies on 2008-3-7.
#  Copyright (c) 2007. All rights reserved.

require File.dirname(__FILE__) + '/../../../spec_helper'

require 'puppet/indirector/certificate_revocation_list/ca_file'

describe Puppet::SSL::CertificateRevocationList::CaFile do
    it "should have documentation" do
        Puppet::SSL::CertificateRevocationList::CaFile.doc.should be_instance_of(String)
    end

    it "should use the :cacrl setting as the crl location" do
        Puppet.settings.stubs(:value).returns "whatever"
        Puppet.settings.stubs(:use)
        Puppet.settings.stubs(:value).with(:cacrl).returns "/request/dir"
        Puppet::SSL::CertificateRevocationList::CaFile.new.path("whatever").should == "/request/dir"
    end
end
