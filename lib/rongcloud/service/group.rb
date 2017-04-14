module Rongcloud
  module Service
    class Group < Rongcloud::Service::Model
      attr_accessor :invite_ids
      attr_accessor :group_id
      attr_accessor :group_name
      attr_accessor :user_id
      attr_accessor :quit_ids

      def req_group_join
        post = {uri: Rongcloud::Service::API_URI[:USER_GROUP_JOIN],
                params: optional_params({userId: self.invite_ids,
                                         groupId: self.group_id,
                                         groupName: self.group_name})
        }
        res = Rongcloud::Service.req_post(post, 'urlencode', true)
        res[:code]==200
      end

      def req_group_dismiss
        post = {uri: Rongcloud::Service::API_URI[:USER_GROUP_DISMISS],
                params: optional_params({userId: self.user_id,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post, 'urlencode', true)
        res[:code]==200
      end

      def req_group_sync group_info
        post = {uri: Rongcloud::Service::API_URI[:USER_GROUP_SYNC],
                params: optional_params({userId: self.user_id}.merge(group_info))
        }
        res = Rongcloud::Service.req_post(post, 'urlencode', true)
        res[:code]==200
      end

      def req_group_refresh
        post = {uri: Rongcloud::Service::API_URI[:USER_GROUP_REFRESH],
                params: optional_params({groupId: self.group_id,
                                         groupName: self.group_name})
        }
        res = Rongcloud::Service.req_post(post, 'urlencode', true)
        res[:code]==200
      end

      def req_group_quit
        post = {uri: Rongcloud::Service::API_URI[:MSG_GROUP_QUIT],
                params: optional_params({userId: self.quit_ids,
                                         groupId: self.group_id})
        }
        res = Rongcloud::Service.req_post(post, 'urlencode', true)
        res[:code]==200
      end
    end
  end
end
