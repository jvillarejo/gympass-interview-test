RSpec.describe Ayrton do
  it "has a version number" do
    expect(Ayrton::VERSION).not_to be nil
  end


  describe Ayrton::Lap do 
    let(:str) { '23:49:08.277      038 – F.MASSA                           1   1:02.852                        44,275' }

    subject(:lap) { Ayrton::Lap.from_line(str) } 

    it { expect(lap.time).to eq('23:49:08.277') }
    it { expect(lap.racer.code).to eq('038') }
    it { expect(lap.racer.name).to eq('F.MASSA') }
    it { expect(lap.number).to eq(1) }
    it { expect(lap.duration).to eq('1:02.852') }
    it { expect(lap.average_speed).to eq('44,275') }
  end
end
