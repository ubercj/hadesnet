# HadesNet

See it live at [https://hades-net.herokuapp.com/](https://hades-net.herokuapp.com/).

This is the final project in the Rails module of The Odin Project. More info about this project [here](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/final-project)

### Structuring the Database

The big hurdle for this assignment is figuring out with Active Record associations you need to make to handle Friends and Friend Requests. I knew right away this would require a self-join, but it took me a long time to figure out how I wanted to handle requests. Should I make a model solely for Friend Requests that destroys itself when the request is accepted or declined?

That didn't make much sense to me, so I decided to just use 1 model and add a boolean 'accepted' parameter on Requests. So in essence, Friendships acts as a through table for the Users self-join and appears in a User's "Sent" or "Received" requests depending on the sender_id and receiver_id, respectively. I experimented with both helper methods and User class methods to identify a User's friends, and I think both would work. I ended up using a combination of both (which is not the most elegant solution, and I might go back and refactor later).

### Using Bulma

I haven't even gotten to the CSS part of the curriculum yet, but I decided to give Bulma a spin and it was very intuitive and satisfying. I highly recommend it to anyone, and their [documentation](https://bulma.io/documentation/) helped me do just about everything I wanted to do with the layout of the site.

#### Mobile Responsiveness, JavaScript, and Turbolinks

After learning more about CSS frameworks and mobile responsiveness, I went back and tweaked some things to make the site function properly on mobile devices. In particular, I added a menu that can be toggled via a [hamburger menu](http://bulma.io/documentation/components/navbar/#navbar-burger) in the navbar. Bulma actually makes this fairly easy, and they even include some sample JavaScript to toggle the visibility of the menu.

There was one thing I wasn't ready for, though - Rails uses Turbolinks by default. So the sample JS provided by Bulma would only set the event listener on the initial page load, but when I navigated to another page, the navigation menu would no longer work. After looking around, I found [this page](https://github.com/turbolinks/turbolinks/blob/master/README.md#observing-navigation-events) from the Turbolinks wiki that explains you need to change the event that adds the listener to the hamburger menu on page load.

I.e. This bit

```js
document.addEventListener('DOMContentLoaded', () => {
  /*...Adding 'click' listener to hamburger menu */
}
```
needs to be changed to this:

```js
document.addEventListener('turbolinks:load', () => {
  /*...Adding 'click' listener to hamburger menu */
}
```

### Facebook Omniauth

I had a really hard time getting Facebook Oauth set up, and ultimately what worked for me was a combination of (surprise, surprise) the documentation for the [facebook-omniauth gem](https://github.com/simi/omniauth-facebook) and [this page](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview) on the Devise wiki which helpfully gives an example of a Facebook Oauth configuration using Devise.

One more note about Oauth, I was *losing my mind* because it still wasn't working even after hours of setup. After sleeping on it, the next day I tried logging in via Facebook in a different browser and it worked! The moral of the story is **always open the development site in a private browser.** The issue was with Firefox's Facebook Container which was somehow interfering with the callback from Facebook, even after I had put my localhost inside the container.

### Mailers and SendGrid woes

Huge shoutout to fellow Odin Project student [andrewjh271](https://github.com/andrewjh271), whose README on his [SocialScrolls](https://github.com/andrewjh271/odin_facebook) project helped me realize that I'm *not the only one* who couldn't get SendGrid to work for me. I tried creating a verified sender, etc. and ultimately they just decided my personal email account is too sketchy for them.

What I ended up doing (as andrewjh271 suggests) is just using the Mail gem which is already included in Rails. The documentation for this is really thorough, but I was still unclear on how to set up the smtp settings to link an email account in the production.rb environment file, but I found a good example (where else) in the [Rails guides](https://guides.rubyonrails.org/action_mailer_basics.html#example-action-mailer-configuration). Ultimately, I ended up creating a new email account and (important) *creating an app password* to put in my application.yml file that I used with the Figaro gem. To my surprise, it works! (For now, at least...)

### APIs, Environment Variables, and Heroku

Before this project, deployment scared me (and it still does to an extent). Although working with APIs was a different lesson, I learned a ton about using them while working on this project. Registering my app with Facebook was a bit more involved than Flickr, and they have some Privacy Policy and Data Deletion requirements to take your app out of "development."

I also discovered that I actually had no idea what an environment variable is... all I knew was that you don't include your API secrets in your public code. Up until now, I just threw everything in the application.yml file from Figaro and it worked out in development. But I realized that when you deploy to Heroku, you have to set your environment variables **on your Heroku app** as well. And that's when I realized kind of the whole point of Figaro, which is that it lets you do it all at once with [figaro heroku:set -e production](https://github.com/laserlemon/figaro#heroku).

### Active Storage

I barely had a grasp on uploading files with Active Storage on my local machine, so I was terrified to figure out how to use a hosting service for photos in production. I ended up going with Cloudinary, and I was surprised that it worked out with much less pain than I was expecting. Their [documentation](https://cloudinary.com/documentation/rails_activestorage) is fantastic, it integrates with Rails's Active Storage, and it's free without a time limit like AWS's 1-year free trial for S3. Most of the trouble I had was figuring out how to connect the API because I didn't know a thing about environment variables in production (see above). Oh another note, if you're coming here from The Odin Project - **do not use the cloudinary-paperclip gem** that is linked to from the project page. Cloudinary has their [own gem](https://rubygems.org/gems/cloudinary) which is very well-supported.

### Conclusion

If you've actually read this far, I hope reading about my struggles and discoveries was of some value to you. I learned a lot working on this project, and I can't wait to learn more!