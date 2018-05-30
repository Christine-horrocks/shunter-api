require_relative '../../rails_helper'

RSpec.describe PageSerializer::PersonShowPageSerializer do
  let(:timeline_roles) { [1, 1, 1] }
  let(:contact_links) { ['Heading', %w[contact1 contact2]] }
  let(:related_links) { %w[component component2] }
  let(:image_download_link) { 'link.com' }
  let(:postal_address) { double('postal_address', full_address: 'Full Address') }
  let(:contact_point) { double('contact_point', email: 'email', phone_number: 123, postal_addresses: [postal_address]) }
  let(:constituency) { double('constituency', name: 'Constituency Name') }
  let(:current_seat_incumbency) { double('current_seat_incumbency', contact_points: [contact_point], constituency: constituency) }
  let(:seat_incumbencies) { double('seat_incumbencies', contact_points: [contact_point], constituency: constituency) }
  let(:party) { double('party', name: 'Party Name') }
  let(:current_party_membership) { double('current_party_membership', party: party) }

  let(:person) do
    double(
      'person',
      full_name: 'Diane Abbott',
      display_name: 'Diane Abbott',
      former_mp?: false,
      former_lord?: false,
      current_mp?: true,
      current_lord?: false,
      image_id: 123,
      graph_id: 321,
      current_seat_incumbency: current_seat_incumbency,
      current_party_membership: current_party_membership,
      committee_memberships: [1],
      incumbencies: [1],
      weblinks?: true,
      personal_weblinks: [1],
      twitter_weblinks: [1],
      facebook_weblinks: [1]
    )
  end
  let(:html) { double('html', html_safe: true) }
  let(:figure_url) { 'figure' }
  let(:image_srcset1) { 'src1' }
  let(:image_srcset2) { 'src2' }
  let(:image_src) { 'src' }
  let(:image_alt) { 'alt' }

  subject(:person_show_page_serializer) { described_class.new(person) }

  context '#to_h' do

    before(:each) do
      allow(person_show_page_serializer).to receive(:timeline_roles) { [1, 2, 3] }
    end

    describe 'correct hashes' do
      it 'when all person information is available' do
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('with_all_data')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if person does not have image_id' do
        allow(person).to receive(:image_id) { nil }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('no_image_id')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if person has image_id that is placeholder' do
        allow(person).to receive(:image_id) { 'placeholder' }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('placeholder_image_id')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if person is not a current mp' do
        allow(person).to receive(:current_mp?) { false }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('not_current_mp')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if contact points is an empty array' do
        allow(current_seat_incumbency).to receive(:contact_points) { [] }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('contact_points_empty_array')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if incumbencies and committee_memberships are empty arrays' do
        allow(person).to receive(:incumbencies) { [] }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('incumbencies_committee_memberships_empty_arrays')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if person has no weblinks and they have no image_id' do
        allow(person).to receive(:weblinks?) { nil }
        allow(person).to receive(:image_id) { nil }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('no_weblinks_or_image_id')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end

      it 'if person has no weblinks and image_id is placeholder' do
        allow(person).to receive(:weblinks?) { nil }
        allow(person).to receive(:image_id) { 'placeholder' }
        allow(ActionController::Base.helpers).to receive(:link_to) { html }
        expected = get_fixture('no_weblinks_placeholder_image_id')

        expect(person_show_page_serializer.to_yaml).to eq expected
      end
      # end

      describe 'serializer initializations' do
        describe 'when all person information is available' do

          it 'contents' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:section_primary_components) { 'section_primary_components' }
            allow(person_show_page_serializer).to receive(:when_to_contact_and_contact) { 'when_to_contact_and_contact' }
            allow(person_show_page_serializer).to receive(:role_timeline_components) { 'role_timeline_components' }
            allow(person_show_page_serializer).to receive(:related_links_block) { 'related_links_block' }

            allow(ComponentSerializer::SectionPrimaryComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ContainerComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ContainerComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ContainerComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::SectionPrimaryComponentSerializer).to have_received(:new).with('section_primary_components')
            expect(ComponentSerializer::ContainerComponentSerializer).to have_received(:new).with('when_to_contact_and_contact')
            expect(ComponentSerializer::ContainerComponentSerializer).to have_received(:new).with('role_timeline_components')
            expect(ComponentSerializer::ContainerComponentSerializer).to have_received(:new).with('related_links_block')
          end

          it 'section_primary_components' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:mp_constituency_information) { 'mp_constituency_information' }
            allow(person_show_page_serializer).to receive(:image_data) { 'image_data' }

            allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ImageComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with(person.full_name, size: 1)
            expect(ComponentSerializer::ParagraphComponentSerializer).to have_received(:new).with('mp_constituency_information')
            expect(ComponentSerializer::ImageComponentSerializer).to have_received(:new).with('image_data')
          end

          it 'when_to_contact_and_contact' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:contact_components) { 'contact_components' }

            allow(ComponentSerializer::WhenToContactComponentSerializer).to receive(:new)
            allow(ComponentSerializer::BlockComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::WhenToContactComponentSerializer).to have_received(:new)
            expect(ComponentSerializer::BlockComponentSerializer).to have_received(:new).with('contact_components')

          end

          it 'role_timeline_components'do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:current_roles_list_items) { 'current_roles_list_items' }
            allow(person_show_page_serializer).to receive(:timeline_roles) { 'timeline_roles' }

            allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ListComponentSerializer).to receive(:new)
            allow(ComponentSerializer::TrackComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with('Roles', size: 2)
            expect(ComponentSerializer::ListComponentSerializer).to have_received(:new).with('current_roles_list_items')
            expect(ComponentSerializer::TrackComponentSerializer).to have_received(:new).with('timeline_roles')
          end

          it 'related_links_block' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:related_links_components) { 'related_links_components' }

            allow(ComponentSerializer::BlockComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::BlockComponentSerializer).to have_received(:new).with('related_links_components', 'block--border__bottom')
          end

          it 'related_links_components' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:related_links) { 'related_links' }
            allow(person_show_page_serializer).to receive(:image_download_link) { 'image_download_link' }
            # allow(person_show_page_serializer).to receive() { 'image_download_link' }


            allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
            allow(ComponentSerializer::DescriptionListComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with('Related links', size: 2)
            expect(ComponentSerializer::DescriptionListComponentSerializer).to have_received(:new).with('related_links')
            expect(ComponentSerializer::ParagraphComponentSerializer).to have_received(:new).with('image_download_link')

          end

          it 'contact_components' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(person_show_page_serializer).to receive(:contact_links) { 'contact_links' }

            allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
            allow(ComponentSerializer::DescriptionListComponentSerializer).to receive(:new)

            person_show_page_serializer.to_h

            expect(ComponentSerializer::HeadingComponentSerializer).to have_received(:new).with('Contact', size: 2)
            expect(ComponentSerializer::DescriptionListComponentSerializer).to have_received(:new).with('contact_links')
          end
        end


        describe 'image component serializer is not initialized' do
          it 'if person does not have image_id' do
            allow(ActionController::Base.helpers).to receive(:link_to) { html }
            allow(ComponentSerializer::ImageComponentSerializer).to receive(:new).with(figure_url: 'data', image_srcset1: 'data', image_srcset2: 'data', image_src: 'data', image_alt: 'data')
            allow(person).to receive(:image_id) { nil }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::ImageComponentSerializer).not_to have_received(:new).with(figure_url: 'data', image_srcset1: 'data', image_srcset2: 'data', image_src: 'data', image_alt: 'data')
          end

          it 'if person has image_id that is placeholder' do
            allow(ComponentSerializer::ImageComponentSerializer).to receive(:new).with(figure_url: 'data', image_srcset1: 'data', image_srcset2: 'data', image_src: 'data', image_alt: 'data')
            allow(person).to receive(:image_id) { 'placeholder' }
            allow(ActionController::Base.helpers).to receive(:link_to) { html }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::ImageComponentSerializer).not_to have_received(:new).with(figure_url: 'data', image_srcset1: 'data', image_srcset2: 'data', image_src: 'data', image_alt: 'data')
          end
        end

        describe 'when-to-contact component serializer is not initialized' do
          it 'if person is not a current mp' do
            allow(ComponentSerializer::WhenToContactComponentSerializer).to receive(:new)
            allow(person).to receive(:current_mp?) { false }
            allow(ActionController::Base.helpers).to receive(:link_to) { html }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::WhenToContactComponentSerializer).not_to have_received(:new)
          end
        end

        describe 'description list component for contacts serializer is not initialized' do
          it 'if contact points is an empty array' do
            allow(ComponentSerializer::DescriptionListComponentSerializer).to receive(:new)
            allow(current_seat_incumbency).to receive(:contact_points) { [] }
            allow(ActionController::Base.helpers).to receive(:link_to) { html }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::DescriptionListComponentSerializer).not_to have_received(:new).with(contact_links)
          end
        end

        describe 'roles list component serializer is not initialized' do
          it 'if incumbencies and committee_memberships are empty arrays' do
            allow(ComponentSerializer::ListComponentSerializer).to receive(:new)
            allow(person).to receive(:incumbencies) { [] }
            allow(ActionController::Base.helpers).to receive(:link_to) { html }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::ListComponentSerializer).not_to have_received(:new).with([], [], [], [])
          end
        end

        describe 'timeline component serializer is not initialized' do
          it 'if incumbencies and committee memberships are empty arrays' do
            allow(ComponentSerializer::TrackComponentSerializer).to receive(:new)
            allow(person).to receive(:incumbencies) { [] }
            allow(ActionController::Base.helpers).to receive(:link_to) { html }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::TrackComponentSerializer).not_to have_received(:new).with(timeline_roles)
          end
        end

        describe 'block component serializer for related links is not initialized' do
          it 'if person has no weblinks and they have no image_id' do
            allow(ComponentSerializer::HeadingComponentSerializer).to receive(:new)
            allow(ComponentSerializer::DescriptionListComponentSerializer).to receive(:new)
            allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)
            allow(person).to receive(:weblinks?) { nil }
            allow(person).to receive(:image_id) { nil }

            person_show_page_serializer.to_h
            expect(ComponentSerializer::HeadingComponentSerializer).not_to have_received(:new).with('.people.related_links.title', 2)
            expect(ComponentSerializer::DescriptionListComponentSerializer).not_to have_received(:new).with(related_links)
            expect(ComponentSerializer::ParagraphComponentSerializer).not_to have_received(:new).with(image_download_link)
          end
        end

        it 'if person has no weblinks and image_id is placeholder' do
          allow(ComponentSerializer::ParagraphComponentSerializer).to receive(:new)
          allow(person).to receive(:weblinks?) { nil }
          allow(person).to receive(:image_id) { 'placeholder' }

          person_show_page_serializer.to_h
          expect(ComponentSerializer::ParagraphComponentSerializer).not_to have_received(:new).with(image_download_link)
        end
      end
    end
  end
end
