module UsersHelper
    def posts_or_comments?
        if user.posts == nil && user.comments == nil
            puts "{user.name} has not submitted any post or comments."
        elsif user.posts == nil && user.comments.count >= 1
            puts "{user.name} has not submitted any post."
        elsif user.posts.count >= 1 && user.comments == nil
            puts "{user.name} has not submitted any comments."
        else
            "{user.name} has posts and comments."
        end
    end
end
