require "spec_helper"

describe Sequel::Plugins::JoinGetter do
    context "has the plugin" do
        class WithPlugin < Sequel::Model
            plugin :join_getter
        end

        it "when it has the value, it has a getter" do
            obj = WithPlugin.new
            obj[:foo] = 1
            obj.foo.should == 1
        end

        it "when it has the value, it has no setter" do
            obj = WithPlugin.new
            obj[:foo] = 1
            expect{ obj.foo = 2 }.to raise_error(NoMethodError, /undefined method `foo=' for #<WithPlugin:0x[0-9a-f]+>/)
        end

        it "when it doesn't have the value, it has no getter" do
            obj = WithPlugin.new
            expect{ obj.foo }.to raise_error(NoMethodError, /undefined method `foo' for #<WithPlugin:0x[0-9a-f]+>/)
        end

        it "when it doesn't have the value, it has no setter" do
            obj = WithPlugin.new
            expect{ obj.foo = 2 }.to raise_error(NoMethodError, /undefined method `foo=' for #<WithPlugin:0x[0-9a-f]+>/)
        end
    end

    context "does not have the plugin" do
        class WithoutPlugin < Sequel::Model
        end

        it "when it has the value, it has no getter" do
            obj = WithoutPlugin.new
            obj[:foo] = 1
            expect{ obj.foo }.to raise_error(NoMethodError, /undefined method `foo' for #<WithoutPlugin.+/)
        end

        it "when it has the value, it has no setter" do
            obj = WithoutPlugin.new
            obj[:foo] = 1
            expect{ obj.foo = 2 }.to raise_error(NoMethodError, /undefined method `foo=' for #<WithoutPlugin.+/)
        end

        it "when it doesn't have the value, it has no getter" do
            obj = WithoutPlugin.new
            expect{ obj.foo }.to raise_error(NoMethodError, /undefined method `foo' for #<WithoutPlugin.+/)
        end

        it "when it doesn't have the value, it has no setter" do
            obj = WithoutPlugin.new
            expect{ obj.foo = 2 }.to raise_error(NoMethodError, /undefined method `foo=' for #<WithoutPlugin.+/)
        end
    end
end
