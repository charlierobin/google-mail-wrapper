# google mail wrapper

Almost the same as https://github.com/charlierobin/proton-mail-app-wrapper, with just a couple of small differences.

Essentially a DesktopHTMLViewer set in a window, with the URL set to

`https://mail.google.com/mail/u/0/#inbox`

The first time you launch the app, the web view will try to load the URL above, and Google steer you through the standard Google authentication process.

As with the Proton Mail app wrapper, when you quit a very simple JSON preferences is saved in your `~/Library/Preferences` directory:

`~/Library/Preferences/com.charlierobin.gmail.json`

This preferences just contains the position and size of the app window, so you don’t have to keep repositioning it in between app launch sessions.

All the DesktopHTMLViewer files, ie: cookies, cached HTML/Javascript/CSS/other web content like images etc, are saved in the following directories:

`~/Library/Caches/com.charlierobin.gmail`
`~/Library/Cookies/com.charlierobin.gmail.binarycookies`
`~/Library/WebKit/com.charlierobin.gmail`

There’s also a standard Apple `Saved Application State` file written:

`~/Library/Saved Application State/com.charlierobin.gmail.savedState`

All these state/cookie files etc are separate from the "standard" Safari history/cookie/storage files on your Mac, and are therefore unaffected if you clear your Safari browsing data.

(Obviously if you do want to "reset" the wrapper app, you need to delete all the files/folders above. If you do that, the next time you launch you'll have to do the Google authentication process etc all over again starting from scratch. Probably a feature I should add as a menu command, so it can be done simply, rather than manually by the user having to poke around in the guts of their own machine.)

Note the the names of all the above files depends on the Bundle Identifier that was used when compiling the app, so in my case it was `com.charlierobin.gmail`.

<img width="380" alt="Screenshot 2023-09-16 at 12 35 26" src="https://github.com/charlierobin/google-mail-wrapper/assets/10506323/56a6767d-a401-4ea8-b8f8-a918e7485af8">

If you wanted something different, you change the identifier and re-build.

If you want to run multiple copies of the app, each handling a different GMail account, you will need to compile a version of the app for each account, with a unique bundle ID.

In other words, to be able to simulataneously work with gmail_account_1@gmail.com, gmail_account_2@gmail.com and gmail_account_3@gmail.com, you need three wrapper apps:


GMail 1 (with bundle id of, say: com.mydomain.gmail.account1)

GMail 2 (with bundle id of, say: com.mydomain.gmail.account2)

GMail 3 (with bundle id of, say: com.mydomain.gmail.account3)


(But it doesn't really matter what the app names and bundle IDs are, as long as they are unique.)

This is a screenshot of all the files/directories that the app creates. (As you can see, in addition to those mentioned above, there's some `/private/var/folders/...` content):

<img width="1064" alt="Screenshot 2023-09-18 at 08 04 04" src="https://github.com/charlierobin/google-mail-wrapper/assets/10506323/45321e07-7aa1-4d64-b6ad-770979604d3d">

As with the Proton Mail app, there is a simple RegEx that looks at the page title and sees if there are unread emails, playing a notification sound if anything is found.

The only other minor difference between the Proton Mail wrapper and this app is that I needed to add a fake `UserAgent` string to the web control, as GMail wouldn't show the modern UI without it, and kept reverting to the "basic" HTML version. So I suppose if for some reason you wanted to force the wrapper app to show only this basic GMail version you could comment this line out and re-build:

`self.Web.UserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Safari/605.1.15"`

(I just copied and pasted the user agent string from a random version of Safari, and it seems to work okay.)

