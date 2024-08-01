## CILogon Authentication Workflow

- [CILogon (OIDC)](https://www.cilogon.org/oidc)
- The Curl example is able to function normally.
- A place to reset cookies (may or may not be related): https://cilogon.org/me/

## OIDC Authentication Error

**Error**: request to the redirect_uri path but there's no session state found \
**Url**: GET
/redirect_uri?code=NB2HI4DTHIXS6Y3JNRXWO33OFZXXEZZPN5QXK5DIGIXTIYZXG43DQZRRMIZGMOJWG5TGIZLCGIYDGM3DMFQTMZLDMY4TEYR7OR4XAZJ5MF2XI2D2I5ZGC3TUEZ2HGPJRG4ZDENJUHE4TINJYHA3SM5TFOJZWS33OHV3DELRQEZWGSZTFORUW2ZJ5HEYDAMBQGA&state=d8adb4fd4055cbb6ecd091b74d26317a
HTTP/1.1

In the keycloak error, the url also contains **session_state** and **state** parameters. This url only contains **code**.
In the Curl example from CILogon, the returned url also only contains **code**.

### Possible Solutions?

- https://github.com/bungle/lua-resty-session#string-sessioncookiesamesite
  - Changing settings for `lua-resty-session` may help?
- https://github.com/zmartzone/lua-resty-openidc/issues/338
    - Something related to `$session_cookie_samesite` being `strict`.
    - Something related to not having callback url as `/redirect_uri`.
- https://github.com/zmartzone/lua-resty-openidc/issues/422
    - **Quote**: "no session state found" means your user's browser has invoked the redirect_uri but the request does
      not
      contain a session cookie (or it has expired). There are many reasons why a browser does not send the cookie, the
      cookie's SameSite setting mentioned in #338 is only one of them. I don't think it is possible to guess why it
      happens
      on your side, the best you can do is try to reproduce the problem and watch the developer tools of your browser to
      see
      why it does not send the cookie - it usually will tell you.
- https://github.com/zmartzone/lua-resty-openidc/issues/499
    - **Quote**: There is no reason why anybody would want to navigate the redirect_uri outside of the OIDC
      authentication flow. This should never be a "normal" URI of your application. The premise "when users configure
      the redirect_uri value as 127.0.0.1:8080/test" simply should never happen.
- https://github.com/zmartzone/lua-resty-openidc/issues/462
  - Something related to package versions.
- https://github.com/apache/apisix/issues/3200
  - Seems like putting `"session": {
        "secret": "<a random string>"
      }` in the opts table might help.
- https://github.com/zmartzone/lua-resty-openidc/issues/243
  - Making the callback url as `/callback` somehow magically solves this person's problem??
- https://github.com/zmartzone/lua-resty-openidc/issues/213
  - Something related to `$session_secret`.

### Recommended Future Approaches
- **Find a way to debug the issue**. Since the error is not very descriptive, it is hard to find the root cause.
- Submit an issue to the `lua-resty-openidc` repo.
- Try the above methods (although most of them have been tested).
- Compare results with the keycloak authentication.
- Understand more about how the sessions/cookies are being set. Understand more about the OIDC Authentication Flow.
- Try to find an alternative to `lua-resty-openidc`?

## TODO
- Regenerate Client ID and Secret.
- May need to create another confluence account or renew the current PAT once in a while (or set a permanent one).
- Solve the authentication error...
- After solving the error, implement the proxy in the virtual environment.