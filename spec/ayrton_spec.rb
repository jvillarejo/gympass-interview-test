RSpec.describe Ayrton do
  it "has a version number" do
    expect(Ayrton::VERSION).not_to be nil
  end

  describe Ayrton::Race do 
    let(:race) { Ayrton::Race.from_file('spec/support/test_file.log') }

    it { expect(race.laps.size).to eq(23) }
    it { expect(race.racers.size).to eq(6) }
    it { expect(race.positions.map(&:racer).map(&:code)).to eq(['038','002','033','023','015','011'])}
    it { expect(race.best_lap.duration.to_s).to eq('1:02.769') }
  end

  describe Ayrton::Result do 
    let(:race) { Ayrton::Race.from_file('spec/support/test_file.log') }
    subject(:result) { race.results.first }

    it { expect(result.total_time.seconds).to eq(251.578) }
    it { expect(result.best_lap.duration.to_s).to eq('1:02.769')}
    it { expect(result.total_laps).to eq(4) }
    it { expect(result.average_speed).to eq(44.24575) }
  end

  describe Ayrton::Duration do 
    subject(:duration) { Ayrton::Duration.new(62.678) }

    it { expect(duration.to_s).to eq('1:02.678') }
  end

  describe Ayrton::Race do 
    let(:str) { '23:49:08.277      038 – F.MASSA                           1   1:02.852                        44,275' }

    subject(:data) { Ayrton::Race.parse_line(str) } 

    it { expect(data[:time]).to eq('23:49:08.277') }
    it { expect(data[:racer].code).to eq('038') }
    it { expect(data[:racer].name).to eq('F.MASSA') }
    it { expect(data[:number]).to eq(1) }
    it { expect(data[:duration].seconds).to eq(62.852) }
    it { expect(data[:average_speed]).to eq(44.275) }
  end
end
