---
visibility: public
title: Software Testing
---
## ShellSpec

[ShellSpec Website](https://shellspec.info)


## InSpec and RSpec

Tags: #dev/test/InSpec #dev/test/spec #dev/test/rspec

- [[InSpec|My notes on Chef InSpec]]
- [[Code Testing|Work notes LWP: Code Testing > InSpec]]
- [InSpec](https://github.com/inspec/inspec)

### Methods

- _expect_: test whether value is as expected (`expect()`) __or changes__ (`expect{}`) as expected

    ```ruby
    # Example
    it "creates one more volunteer" do
      create_volunteer
      expect(Volunteer.count).to eq(1)
    end
    # vs
    it "creates one more volunteer" do
      expect{create_volunteer}.to change(Volunteer, :count).by(1)
    end
    ```
