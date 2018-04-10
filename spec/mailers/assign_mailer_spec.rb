require "rails_helper"

RSpec.describe AssignMailer, type: :mailer do
  describe "sendmail_assigned" do
    let(:mail) { AssignMailer.sendmail_assigned }

    it "renders the headers" do
      expect(mail.subject).to eq("Sendmail assigned")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
