require 'spec_helper'

describe Mercadopago::Config, specific_specs: true do
  subject(:config){ Mercadopago::Config }

  describe 'access_token' do
    context 'when is not set' do
      before { Mercadopago::Config.reset! }
      it { expect{ config.access_token }.to raise_error(Mercadopago::Errors::CredentialNotFound) }
    end

    context 'configure via config block' do
      let(:access_token){ 'foo_bar_access_token' }

      before do
        Mercadopago.configure{|c| c.access_token = access_token }
      end

      it { expect(config.access_token).to be(access_token) }
    end

  end

  describe 'public_key' do

    context 'when is not set' do
      before { Mercadopago::Config.reset! }
      it{ expect{ config.public_key }.to raise_error(Mercadopago::Errors::CredentialNotFound) }
    end

    context 'configure via config block' do
      let(:public_key){ 'foo_bar_public_key' }

      before do
        Mercadopago.configure{|c| c.public_key = public_key }
      end

      it{ expect(config.public_key).to be(public_key) }
    end
  end

end
