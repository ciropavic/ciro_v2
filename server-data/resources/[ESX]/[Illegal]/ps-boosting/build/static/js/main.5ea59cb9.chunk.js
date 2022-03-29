(this.webpackJsonpboost = this.webpackJsonpboost || []).push([
  [0],
  {
    87: function (t, e, n) {},
    98: function (t, e, n) {
      "use strict";
      n.r(e);
      var c = n(0),
        s = n.n(c),
        i = n(23),
        a = n.n(i),
        o = n(4),
        r = (n(87), n(14)),
        l = n(136),
        j = n(1),
        u = function (t) {
          var e = t.completed,
            n = { width: "".concat(e, "%") };
          return Object(j.jsx)("div", {
            children: Object(j.jsx)("div", {
              className: "proggresBoosting",
              children: Object(j.jsx)("div", {
                style: n,
                className: "proggresBoosting2",
              }),
            }),
          });
        },
        b = n(143),
        d = n(150),
        m = n(144),
        O = n(56),
        p = n.n(O),
        h = n(65);
      function x(t, e) {
        return f.apply(this, arguments);
      }
      function f() {
        return (f = Object(h.a)(
          p.a.mark(function t(e, n) {
            var c, s, i, a;
            return p.a.wrap(function (t) {
              for (;;)
                switch ((t.prev = t.next)) {
                  case 0:
                    return (
                      (c = {
                        method: "post",
                        headers: {
                          "Content-Type": "application/json; charset=UTF-8",
                        },
                        body: JSON.stringify(n),
                      }),
                      (s = window.GetParentResourceName
                        ? window.GetParentResourceName()
                        : "nui-frame-app"),
                      (t.next = 4),
                      fetch("https://".concat(s, "/").concat(e), c)
                    );
                  case 4:
                    return (i = t.sent), (t.next = 7), i.json();
                  case 7:
                    return (a = t.sent), t.abrupt("return", a);
                  case 9:
                  case "end":
                    return t.stop();
                }
            }, t);
          })
        )).apply(this, arguments);
      }
      var g = function (t) {
          var e = Object(c.useState)(!0),
            n = Object(o.a)(e, 2),
            s = n[0],
            i = n[1],
            a = Object(c.useState)(!1),
            r = Object(o.a)(a, 2),
            u = r[0],
            O = r[1],
            p = Object(c.useState)(!1),
            h = Object(o.a)(p, 2),
            f = h[0],
            g = h[1],
            v = Object(c.useState)(!1),
            C = Object(o.a)(v, 2),
            N = C[0],
            y = C[1],
            S = Object(c.useState)(!1),
            w = Object(o.a)(S, 2),
            E = w[0],
            I = w[1],
            B = Object(c.useState)(!1),
            k = Object(o.a)(B, 2),
            T = k[0],
            P = k[1],
            L = Object(c.useState)(!1),
            A = Object(o.a)(L, 2),
            R = A[0],
            G = A[1],
            U = Object(c.useState)(!1),
            F = Object(o.a)(U, 2),
            M = F[0],
            V = F[1],
            D = Object(c.useState)(""),
            Y = Object(o.a)(D, 2),
            K = Y[0],
            J = Y[1];
          Object(c.useEffect)(function () {
            window.addEventListener("message", function (t) {
              var e;
              t.data &&
                "UpdateValueUI" === (e = t.data).action &&
                "SetDisableButtons" === e.app &&
                V(!1);
            });
          }, []);
          var q = function (t) {
              J(t.target.value);
            },
            _ = function () {
              y(!0), O(!0);
            },
            X = function () {
              I(!0), y(!0);
            },
            z = function () {
              y(!1), I(!1), P(!1), G(!1), O(!1);
            },
            Q = function (t) {
              I(!1), y(!0), P(!0), G(t);
            },
            W = Object(m.a)({
              root: {
                "& .MuiInput-underline:after": { borderBottomColor: "white" },
                "& .MuiInput-underline:before": { borderBottomColor: "white" },
                "& .MuiInput-underline:hover:not(.Mui-focused):before": {
                  borderBottomColor: "white",
                },
              },
            })();
          return Object(j.jsx)("div", {
            children: Object(j.jsx)(l.a, {
              direction: "left",
              in: s,
              mountOnEnter: !0,
              unmountOnExit: !0,
              children: Object(j.jsxs)("div", {
                className: "ContractsInformationContainter",
                children: [
                  Object(j.jsx)(l.a, {
                    direction: "down",
                    in: u,
                    mountOnEnter: !0,
                    unmountOnExit: !0,
                    children: Object(j.jsxs)("div", {
                      className: "setInputZone",
                      children: [
                        Object(j.jsx)("button", {
                          className: "closeRemove",
                          style: { left: "85%", top: "-60px" },
                          onClick: z,
                          children: Object(j.jsx)("i", {
                            className: "fas fa-times",
                            style: { color: "white" },
                          }),
                        }),
                        Object(j.jsx)("div", {
                          className: "transferinfo",
                          children:
                            "Are you sure you want to transfer the contract?",
                        }),
                        Object(j.jsx)("form", {
                          onSubmit: function (e) {
                            e.preventDefault(),
                              K.trim().length > 0 &&
                                (O(!1),
                                i(!1),
                                x("ps-boosting:transferContract", {
                                  props: t,
                                  imputValue: K,
                                }));
                          },
                          autoComplete: "off",
                          children: Object(j.jsx)(
                            b.a,
                            {
                              className: "textfix",
                              id: "input-with-icon-textfield",
                              label: "Enter ID",
                              classes: W,
                              onChange: q,
                              InputLabelProps: { style: { color: "white" } },
                              InputProps: {
                                startAdornment: Object(j.jsx)(d.a, {
                                  position: "start",
                                  children: Object(j.jsx)("i", {
                                    className: "fas fa-people-arrows",
                                    style: { color: "white" },
                                  }),
                                }),
                              },
                              variant: "standard",
                            },
                            q
                          ),
                        }),
                      ],
                    }),
                  }),
                  Object(j.jsx)(l.a, {
                    direction: "down",
                    in: f,
                    mountOnEnter: !0,
                    unmountOnExit: !0,
                    children: Object(j.jsxs)("div", {
                      className: "startContracZone",
                      children: [
                        Object(j.jsx)("h1", { children: "Starting Contract" }),
                        Object(j.jsx)("div", {
                          className: "inLoad",
                          children: Object(j.jsx)("img", {
                            alt: "img",
                            src: "https://c.tenor.com/I6kN-6X7nhAAAAAj/loading-buffering.gif",
                            width: "64",
                            height: "64",
                          }),
                        }),
                      ],
                    }),
                  }),
                  N
                    ? Object(j.jsx)(j.Fragment, {})
                    : Object(j.jsxs)(j.Fragment, {
                        children: [
                          Object(j.jsx)("div", {
                            className: "typeContainer",
                            children: Object(j.jsx)("span", {
                              className: "typeReal",
                              children: "".concat(t.type),
                            }),
                          }),
                          Object(j.jsxs)("div", {
                            className: "infoContainer1",
                            children: [
                              Object(j.jsx)("div", {
                                style: { marginTop: "4%" },
                                children: "".concat(t.owner),
                              }),
                              Object(j.jsx)("div", {
                                style: { marginTop: "4%" },
                                children: Object(j.jsx)("b", {
                                  children: "".concat(t.vehicleName),
                                }),
                              }),
                              Object(j.jsx)("div", {
                                style: { marginTop: "4%" },
                                children: "Buy in: ".concat(t.units, " GNE"),
                              }),
                              Object(j.jsxs)("div", {
                                style: { marginTop: "4%" },
                                children: [
                                  "Expires in:",
                                  Object(j.jsx)("span", {
                                    style: { color: "green" },
                                    children: " ".concat(t.expires, " hours"),
                                  }),
                                ],
                              }),
                            ],
                          }),
                          Object(j.jsx)("div", {
                            className: "buttonContractsInformationContainer",
                            children: M
                              ? Object(j.jsxs)(j.Fragment, {
                                  children: [
                                    Object(j.jsx)("button", {
                                      disabled: !0,
                                      onClick: X,
                                      className: "DisabledButtons",
                                      children: "Contract In Progress",
                                    }),
                                    Object(j.jsx)("button", {
                                      disabled: !0,
                                      onClick: _,
                                      className: "DisabledButtons",
                                      children: "Transfer Contract",
                                    }),
                                    Object(j.jsx)("button", {
                                      onClick: function () {
                                        x("ps-boosting:cancelContract", {
                                          props: t,
                                          IsInProgress: M,
                                        });
                                      },
                                      className: "CancelButton",
                                      children: "Cancel Contract",
                                    }),
                                  ],
                                })
                              : Object(j.jsxs)(j.Fragment, {
                                  children: [
                                    Object(j.jsx)("button", {
                                      disabled: t.disableButtons,
                                      onClick: X,
                                      className: "ContractsButon",
                                      children: "Start Contract",
                                    }),
                                    Object(j.jsx)("button", {
                                      disabled: t.disableButtons,
                                      onClick: _,
                                      className: "ContractsButon",
                                      children: "Transfer Contract",
                                    }),
                                    Object(j.jsx)("button", {
                                      disabled: t.disableButtons,
                                      onClick: function () {
                                        x("ps-boosting:DeclineContract", {
                                          props: t,
                                          IsInProgress: M,
                                        });
                                      },
                                      className: "ContractsButon",
                                      children: "Decline Contract",
                                    }),
                                  ],
                                }),
                          }),
                        ],
                      }),
                  E
                    ? Object(j.jsxs)(j.Fragment, {
                        children: [
                          Object(j.jsx)("button", {
                            className: "closeRemove",
                            onClick: z,
                            children: Object(j.jsx)("i", {
                              className: "fas fa-times",
                              style: { color: "white" },
                            }),
                          }),
                          Object(j.jsxs)("div", {
                            className: "infoContainer1",
                            children: [
                              Object(j.jsx)("div", {
                                style: { marginTop: "4%", fontSize: "20px" },
                                children: Object(j.jsx)("b", {
                                  children: "Select Type",
                                }),
                              }),
                              Object(j.jsx)("div", {
                                style: {
                                  marginTop: "4%",
                                  fontSize: "0.9rem",
                                  color: "#a1a1a1",
                                },
                                children:
                                  "If you choose vin scratch it will cost and additional ".concat(
                                    t.ExtraVin,
                                    " GNE to claim ownership."
                                  ),
                              }),
                              Object(j.jsx)("button", {
                                onClick: function () {
                                  Q(!0);
                                },
                                className: "ContractsButon",
                                style: { top: "25px", left: "0%" },
                                children: "Vin Scratch",
                              }),
                              Object(j.jsx)("button", {
                                onClick: function () {
                                  Q(!1);
                                },
                                className: "ContractsButon",
                                style: { top: "25px", left: "0%" },
                                children: "Normal Dropoff",
                              }),
                            ],
                          }),
                        ],
                      })
                    : Object(j.jsx)(j.Fragment, {}),
                  T
                    ? Object(j.jsx)(j.Fragment, {
                        children: Object(j.jsxs)("div", {
                          className: "infoContainer1",
                          children: [
                            Object(j.jsx)("div", {
                              style: { marginTop: "4%", fontSize: "20px" },
                              children: Object(j.jsx)("b", {
                                children: "Start Contract?",
                              }),
                            }),
                            Object(j.jsx)("button", {
                              onClick: function () {
                                O(!1),
                                  g(!0),
                                  P(!1),
                                  setTimeout(function () {
                                    y(!1),
                                      g(!1),
                                      x("ps-boosting:startContract", {
                                        props: t,
                                        IsVin: R,
                                      }).then(function (t) {
                                        t.Contract ? V(!0) : V(!1);
                                      });
                                  }, 3e3);
                              },
                              className: "ContractsButon",
                              style: { top: "25px", left: "0%" },
                              children: "Continue",
                            }),
                            Object(j.jsx)("button", {
                              onClick: z,
                              className: "ContractsButon",
                              style: { top: "25px", left: "0%" },
                              children: "Cancel",
                            }),
                          ],
                        }),
                      })
                    : Object(j.jsx)(j.Fragment, {}),
                ],
              }),
            }),
          });
        },
        v = n(33),
        C = n.n(v),
        N = s.a.memo(function (t) {
          var e = t.counter,
            n = t.setCounter,
            s = Object(c.useRef)(),
            i = Object(c.useState)([]),
            a = Object(o.a)(i, 2),
            b = a[0],
            d = a[1],
            m = Object(c.useState)(!1),
            O = Object(o.a)(m, 2),
            p = O[0],
            h = O[1],
            f = Object(c.useState)(!1),
            v = Object(o.a)(f, 2),
            N = v[0],
            y = v[1],
            S = Object(c.useState)(0),
            w = Object(o.a)(S, 2),
            E = w[0],
            I = w[1],
            B = Object(c.useState)(0),
            k = Object(o.a)(B, 2),
            T = k[0],
            P = k[1],
            L = Object(c.useState)(0),
            A = Object(o.a)(L, 2),
            R = A[0],
            G = A[1],
            U = Object(c.useState)(""),
            F = Object(o.a)(U, 2),
            M = F[0],
            V = F[1],
            D = Object(c.useState)(""),
            Y = Object(o.a)(D, 2),
            K = Y[0],
            J = Y[1];
          Object(c.useEffect)(function () {
            window.addEventListener("message", function (t) {
              var e;
              t.data &&
                "UpdateValueUI" === (e = t.data).action &&
                ("ContractsBoosting" === e.app
                  ? d(function (t) {
                      return [e.data.contracts].concat(Object(r.a)(t));
                    })
                  : "RemoveContractInfo" === e.app
                  ? q(e.data.IdToRemove)
                  : "SetBoostingLevel" === e.app
                  ? (V(e.data.type1),
                    J(e.data.type2),
                    I(e.data.level),
                    P(e.data.gne))
                  : "SetDisableButtons" === e.app
                  ? h(e.data.enableButtons)
                  : "SetExtraVin" === e.app
                  ? G(e.data.ExtraVin)
                  : e.app);
            });
          }, []);
          var q = function (t) {
              d(function (e) {
                var n = Object(r.a)(e),
                  c = n.findIndex(function (e) {
                    return e.id === t;
                  });
                return n.splice(c, 1), n;
              });
            },
            _ = function (t) {
              y(t), x("ps-boosting:JoinQueue", { queue: t });
            };
          return Object(j.jsx)("div", {
            children: Object(j.jsx)(C.a, {
              defaultPosition: { x: 0, y: -440 },
              ref: s,
              children: Object(j.jsx)("div", {
                className: e ? "" : "hiddenComponent",
                children: Object(j.jsxs)("div", {
                  className: "browser1",
                  ref: s,
                  children: [
                    Object(j.jsx)(
                      "button",
                      {
                        className: "btn close-btn",
                        onClick: function () {
                          n(!1);
                        },
                      },
                      "cclose-btn"
                    ),
                    Object(j.jsx)(
                      "button",
                      { className: "btn min-btn" },
                      "cmin-btn"
                    ),
                    Object(j.jsx)("div", {
                      className: "texto boosting-text",
                      children: "Boosting Contracts",
                    }),
                    Object(j.jsx)(
                      "button",
                      {
                        disabled: p,
                        className: "butMycontracts",
                        children: "MY CONTRACTS",
                      },
                      "ContractOpen1"
                    ),
                    N
                      ? Object(j.jsx)(
                          "button",
                          {
                            onClick: function () {
                              return _(!1);
                            },
                            className: "butMyqueue",
                            style: { marginLeft: "90em" },
                            children: "LEAVE QUEUE",
                          },
                          "ContractOpen2"
                        )
                      : Object(j.jsx)(
                          "button",
                          {
                            onClick: function () {
                              return _(!0);
                            },
                            disabled: p,
                            className: "butMyqueue",
                            style: { marginLeft: "90em" },
                            children: "JOIN QUEUE",
                          },
                          "ContractOpen3"
                        ),
                    Object(j.jsx)("div", {
                      className: "gholsi",
                      children: Object(j.jsx)(l.a, {
                        direction: "down",
                        in: !0,
                        mountOnEnter: !0,
                        unmountOnExit: !0,
                        children: Object(j.jsxs)("div", {
                          className: "contracts_container",
                          children: [
                            Object(j.jsx)(u, { completed: E }),
                            Object(j.jsx)("div", {
                              className: "levelProggres1",
                              children: M,
                            }),
                            Object(j.jsx)("span", {
                              className: "levelProggres2",
                              children: K,
                            }),
                            Object(j.jsx)("div", {
                              className: "contractsContainers",
                              children: b.map(function (t) {
                                return Object(j.jsx)(j.Fragment, {
                                  children: Object(j.jsx)(g, {
                                    disableButtons: p,
                                    id: t.id,
                                    vehicle: t.vehicle,
                                    vehicleName: t.vehicleName,
                                    type: t.type,
                                    owner: t.owner,
                                    expires: t.expires,
                                    units: t.units,
                                    coords: t.coords,
                                    identifier: t.identifier,
                                    ExtraVin: R,
                                  }),
                                });
                              }),
                            }),
                          ],
                        }),
                      }),
                    }),
                    Object(j.jsx)("p", {
                      className: "GNE",
                      style: { top: "-2%" },
                      children: "Your GNE ".concat(T),
                    }),
                  ],
                }),
              }),
            }),
          });
        }),
        y = n.p + "static/media/pop.113cfc79.mp3",
        S = function (t) {
          var e = t.props,
            n = (t.OutNotifications, t.setOutNotifications),
            s = Object(c.useState)(!0),
            i = Object(o.a)(s, 2),
            a = i[0],
            u =
              (i[1],
              function (t, e, c) {
                n(function (n) {
                  var s = Object(r.a)(n),
                    i = s.findIndex(function (n) {
                      return n.app === t && n.time === e && n.msg === c;
                    });
                  return s.splice(i, 1), s;
                });
              });
          return (
            setTimeout(function () {
              u(e.app, e.time, e.msg);
            }, 3500),
            Object(j.jsx)(l.a, {
              direction: "left",
              in: a,
              mountOnEnter: !0,
              unmountOnExit: !0,
              children: Object(j.jsxs)("div", {
                className: "NotificationBack2",
                children: [
                  Object(j.jsxs)("div", {
                    className: "NotiText",
                    children: [
                      Object(j.jsx)("span", {
                        children: Object(j.jsx)("b", { children: e.app }),
                      }),
                      Object(j.jsx)("div", {
                        className: "NotiTime",
                        children: e.time,
                      }),
                      Object(j.jsx)("div", {
                        style: { marginTop: "3px" },
                        children: e.msg,
                      }),
                    ],
                  }),
                  Object(j.jsx)("div", {
                    className: "NotiIcon",
                    children: Object(j.jsx)("img", {
                      alt: "img",
                      src: e.img,
                      height: 32,
                      width: 32,
                    }),
                  }),
                ],
              }),
            })
          );
        },
        w = function (t) {
          var e = t.counter,
            n = t.setCounter,
            s = new Audio(y),
            i = Object(c.useRef)(),
            a = Object(c.useState)([]),
            u = Object(o.a)(a, 2),
            b = u[0],
            d = u[1],
            m = Object(c.useState)([]),
            O = Object(o.a)(m, 2),
            p = O[0],
            h = O[1];
          Object(c.useEffect)(
            function () {
              var t = function (t) {
                e && i.current && !i.current.contains(t.target) && n(!1);
              };
              return (
                document.addEventListener("mousedown", t),
                function () {
                  document.removeEventListener("mousedown", t);
                }
              );
            },
            [e, n]
          );
          return (
            Object(c.useEffect)(function () {
              window.addEventListener("message", function (t) {
                var e;
                t.data &&
                  "UpdateValueUI" === (e = t.data).action &&
                  "BoostingNotification" === e.app &&
                  (JSON.parse(localStorage.getItem("popaudio")).pop && s.play(),
                  d(function (t) {
                    return [e.data.notify].concat(Object(r.a)(t));
                  }),
                  h(function (t) {
                    return [e.data.notify].concat(Object(r.a)(t));
                  }));
              });
            }, []),
            Object(j.jsxs)("div", {
              children: [
                Object(j.jsx)(l.a, {
                  direction: "left",
                  in: e,
                  mountOnEnter: !0,
                  unmountOnExit: !0,
                  children: Object(j.jsxs)("div", {
                    className: "notificationContainer",
                    ref: i,
                    children: [
                      Object(j.jsx)("div", {
                        className: "texto notification-text",
                        children: "Notifications",
                      }),
                      Object(j.jsx)("div", {
                        className: "nContainer",
                        children: b.map(function (t) {
                          return Object(j.jsxs)("div", {
                            className: "NotificationBack",
                            children: [
                              Object(j.jsxs)("div", {
                                className: "NotiText",
                                children: [
                                  Object(j.jsx)("span", {
                                    children: Object(j.jsx)("b", {
                                      children: t.app,
                                    }),
                                  }),
                                  Object(j.jsx)("div", {
                                    className: "NotiTime",
                                    children: t.time,
                                  }),
                                  Object(j.jsx)("div", {
                                    style: { marginTop: "3px" },
                                    children: t.msg,
                                  }),
                                ],
                              }),
                              Object(j.jsx)("div", {
                                className: "NotiIcon",
                                children: Object(j.jsx)("img", {
                                  alt: "img",
                                  src: t.img,
                                  height: 32,
                                  width: 32,
                                }),
                              }),
                            ],
                          });
                        }),
                      }),
                    ],
                  }),
                }),
                Object(j.jsx)("div", {
                  className: "remove",
                  children: p.map(function (t) {
                    return Object(j.jsx)(S, {
                      props: t,
                      OutNotifications: p,
                      setOutNotifications: h,
                    });
                  }),
                }),
              ],
            })
          );
        },
        E = n(148),
        I = n(146),
        B = n(151),
        k = [
          { name: "Ferrar", url: "https://imgur.com/o4VGrTt.png" },
          { name: "Yung", url: "https://imgur.com/1KFfsh7.png" },
          { name: "Dirft", url: "https://imgur.com/nu3ppBq.png" },
          { name: "GTR", url: "https://imgur.com/ifTiZfC.jpg" },
          { name: "AMG", url: "https://imgur.com/K6mwCI1.png" },
          { name: "R34", url: "https://imgur.com/bAiWRqM.jpg" },
          { name: "Lambo", url: "https://imgur.com/Ipv5AyV.png" },
          { name: "R342", url: "https://imgur.com/aLaieBN.png" },
          { name: "MCLAREN", url: "https://imgur.com/UN94OX0.png" },
        ],
        T = function (t) {
          var e = t.counter,
            n = t.setCounter,
            s = t.setWallpaper,
            i = Object(c.useRef)(),
            a = Object(c.useRef)(),
            r = Object(c.useState)(function () {
              return (
                JSON.parse(localStorage.getItem("popaudio")) || { pop: !0 }
              );
            }),
            u = Object(o.a)(r, 2),
            O = u[0],
            p = u[1],
            h = Object(c.useState)(""),
            x = Object(o.a)(h, 2),
            f = x[0],
            g = x[1],
            v = Object(c.useState)(!1),
            C = Object(o.a)(v, 2),
            N = C[0],
            y = C[1],
            S = function (t) {
              g(t.target.value);
            };
          Object(c.useEffect)(
            function () {
              localStorage.setItem("popaudio", JSON.stringify(O));
            },
            [O]
          );
          Object(c.useEffect)(
            function () {
              var t = function (t) {
                e && i.current && !i.current.contains(t.target) && n(!1);
              };
              return (
                document.addEventListener("mousedown", t),
                function () {
                  document.removeEventListener("mousedown", t);
                }
              );
            },
            [e, n]
          ),
            Object(c.useEffect)(
              function () {
                var t = function (t) {
                  N && a.current && !a.current.contains(t.target) && y(!1);
                };
                return (
                  document.addEventListener("mousedown", t),
                  function () {
                    document.removeEventListener("mousedown", t);
                  }
                );
              },
              [N, y]
            );
          var w = Object(m.a)({
            root: {
              "& .MuiInput-underline:after": { borderBottomColor: "white" },
              "& .MuiInput-underline:before": { borderBottomColor: "white" },
              "& .MuiInput-underline:hover:not(.Mui-focused):before": {
                borderBottomColor: "white",
              },
            },
          })();
          return Object(j.jsxs)("div", {
            children: [
              Object(j.jsx)(l.a, {
                direction: "left",
                in: e,
                mountOnEnter: !0,
                unmountOnExit: !0,
                children: Object(j.jsxs)("div", {
                  className: "settingsContainer",
                  ref: i,
                  children: [
                    Object(j.jsx)("div", {
                      className: "texto settings-text",
                      children: "Settings",
                    }),
                    Object(j.jsx)("form", {
                      onSubmit: function (t) {
                        t.preventDefault(), f.trim().length > 10 && s(f);
                      },
                      autoComplete: "off",
                      children: Object(j.jsx)(
                        b.a,
                        {
                          className: "textfix",
                          id: "input-with-icon-textfield",
                          label: "Enter Background",
                          classes: w,
                          InputLabelProps: { style: { color: "white" } },
                          onChange: S,
                          InputProps: {
                            startAdornment: Object(j.jsx)(d.a, {
                              position: "start",
                              children: Object(j.jsx)("i", {
                                className: "fas fa-photo-video",
                                style: { color: "white" },
                              }),
                            }),
                          },
                          variant: "standard",
                        },
                        S
                      ),
                    }),
                    Object(j.jsxs)("div", {
                      className: "btnfix",
                      children: [
                        Object(j.jsxs)("label", {
                          htmlFor: "contained-button-file",
                          children: [
                            Object(j.jsx)(E.a, {
                              variant: "contained",
                              component: "span",
                              sx: {
                                ":hover": {
                                  bgcolor: "#69a74f",
                                  color: "white",
                                },
                              },
                              onClick: function () {},
                              children: "SAVE",
                            }),
                            Object(j.jsx)(E.a, {
                              variant: "contained",
                              component: "span",
                              className: "fixbtn2",
                              sx: {
                                ":hover": {
                                  bgcolor: "#69a74f",
                                  color: "white",
                                },
                              },
                              onClick: function () {
                                n(!1), y(!0);
                              },
                              children: "PRESETS",
                            }),
                          ],
                        }),
                        Object(j.jsx)("div", {
                          className: "checkboxFix",
                          children: Object(j.jsx)(B.a, {
                            control: Object(j.jsx)(I.a, {
                              checked: O.pop,
                              onChange: function (t) {
                                p({ pop: t.target.checked });
                              },
                              style: { color: "#F2A365" },
                            }),
                            color: "primary",
                            label: Object(j.jsx)("span", {
                              style: { color: "white" },
                              children: "Notification Audio",
                            }),
                          }),
                        }),
                      ],
                    }),
                  ],
                }),
              }),
              Object(j.jsx)(l.a, {
                direction: "left",
                in: N,
                mountOnEnter: !0,
                unmountOnExit: !0,
                children: Object(j.jsxs)("div", {
                  className: "PresetsContainer",
                  ref: a,
                  children: [
                    Object(j.jsx)("div", {
                      className: "texto settings-text",
                      children: "Preset Backgrounds",
                    }),
                    Object(j.jsx)("div", {
                      className: "bgPresetsContainer",
                      children: k.map(function (t) {
                        return Object(j.jsx)(
                          "button",
                          {
                            onClick: function () {
                              return s(t.url);
                            },
                            className: "bgButton",
                            children: Object(j.jsx)("img", {
                              alt: "img",
                              src: t.url,
                              className: "bgcontainer",
                              height: "120",
                              width: "198",
                            }),
                          },
                          t.url
                        );
                      }),
                    }),
                  ],
                }),
              }),
            ],
          });
        },
        P = function (t) {
          var e = t.icon,
            n = t.label,
            s = t.price,
            i = t.item,
            a = t.GenCounter,
            l = t.SetGenCounter,
            u = t.SetCartItems,
            b = t.ToPay,
            d = t.SetToPay,
            m = Object(c.useState)(0),
            O = Object(o.a)(m, 2),
            p = O[0],
            h = O[1];
          return Object(j.jsxs)("div", {
            className: "bennysItems",
            children: [
              p > 0
                ? Object(j.jsx)("button", {
                    className: "CounterBennys",
                    children: p,
                  })
                : Object(j.jsx)(j.Fragment, {}),
              Object(j.jsx)("div", {
                className: "bennysIcon",
                children: Object(j.jsx)("img", {
                  alt: "img",
                  src: e,
                  style: { left: "-50px" },
                }),
              }),
              Object(j.jsxs)("div", {
                className: "BennysText",
                children: [
                  Object(j.jsx)("p", { children: n }),
                  Object(j.jsx)("p", { children: "Price: ".concat(s, " GNE") }),
                ],
              }),
              Object(j.jsx)("button", {
                className: "BennysAddCartBTN",
                onClick: function () {
                  h(p + 1),
                    l(a + 1),
                    d(b + s),
                    u(function (t) {
                      return [
                        { label: n, item: i, price: s, icon: e, index: a + 1 },
                      ].concat(Object(r.a)(t));
                    });
                },
                children: "ADD TO CART",
              }),
            ],
          });
        },
        L = s.a.memo(function (t) {
          var e = t.counter,
            n = t.setCounter,
            s = Object(c.useRef)(),
            i = Object(c.useState)(0),
            a = Object(o.a)(i, 2),
            l = a[0],
            u = a[1],
            b = Object(c.useState)(0),
            d = Object(o.a)(b, 2),
            m = d[0],
            O = d[1],
            p = Object(c.useState)(0),
            h = Object(o.a)(p, 2),
            f = h[0],
            g = h[1],
            v = Object(c.useState)(!1),
            N = Object(o.a)(v, 2),
            y = N[0],
            S = N[1],
            w = Object(c.useState)(!1),
            E = Object(o.a)(w, 2),
            I = E[0],
            B = E[1],
            k = Object(c.useState)(!1),
            T = Object(o.a)(k, 2),
            L = T[0],
            A = T[1],
            R = Object(c.useState)(!1),
            G = Object(o.a)(R, 2),
            U = G[0],
            F = G[1],
            M = Object(c.useState)([]),
            V = Object(o.a)(M, 2),
            D = V[0],
            Y = V[1],
            K = Object(c.useState)([]),
            J = Object(o.a)(K, 2),
            q = J[0],
            _ = J[1],
            X = Object(c.useState)([]),
            z = Object(o.a)(X, 2),
            Q = z[0],
            W = z[1],
            Z = Object(c.useState)([]),
            H = Object(o.a)(Z, 2),
            $ = H[0],
            tt = H[1],
            et = Object(c.useState)([]),
            nt = Object(o.a)(et, 2),
            ct = nt[0],
            st = nt[1],
            it = Object(c.useState)([
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
              {
                label: "Item Performance",
                item: "item",
                price: 125,
                icon: "https://imgur.com/UxYwiKC.png",
              },
            ]),
            at = Object(o.a)(it, 2),
            ot = at[0],
            rt = at[1],
            lt = Object(c.useState)([]),
            jt = Object(o.a)(lt, 2),
            ut = jt[0],
            bt = jt[1];
          Object(c.useEffect)(function () {
            window.addEventListener("message", function (t) {
              var e;
              t.data &&
                "UpdateValueUI" === (e = t.data).action &&
                ("SetConsumableItems" === e.app
                  ? tt(e.data.ConsumableItems)
                  : "SetPerformanceObject" === e.app
                  ? st(e.data.PerformanceObject)
                  : "SetCosmeticObject" === e.app
                  ? rt(e.data.CosmeticObject)
                  : "SetBoostingLevel" === e.app && g(e.data.gne));
            });
          }, []);
          return Object(j.jsx)("div", {
            children: Object(j.jsx)(C.a, {
              defaultPosition: { x: 0, y: -440 },
              ref: s,
              children: Object(j.jsx)("div", {
                className: e ? "" : "hiddenComponent",
                children: Object(j.jsxs)("div", {
                  className: "BennysApp",
                  ref: s,
                  children: [
                    Object(j.jsx)(
                      "button",
                      {
                        className: "btn close-btn",
                        style: { top: "-6%", left: "83%" },
                        onClick: function () {
                          n(!1);
                        },
                      },
                      "cclose-btn"
                    ),
                    Object(j.jsx)(
                      "button",
                      {
                        className: "btn min-btn",
                        style: { top: "-6%", left: "73%" },
                      },
                      "cmin-btn"
                    ),
                    Object(j.jsx)("div", {
                      className: "texto boosting-text",
                      children: "Bennys Online Shop",
                    }),
                    Object(j.jsx)(
                      "button",
                      {
                        className: "ButBennys",
                        onClick: function () {
                          A(!0), B(!1), S(!1), F(!1), W(ot);
                        },
                        children: "COSMETIC PARTS",
                      },
                      "Cometic3"
                    ),
                    Object(j.jsx)(
                      "button",
                      {
                        className: "ButBennys",
                        onClick: function () {
                          B(!0), S(!1), A(!1), F(!1), _(ct);
                        },
                        children: "PERFORMANCE PARTS",
                      },
                      "Performance3"
                    ),
                    Object(j.jsx)(
                      "button",
                      {
                        className: "ButBennys",
                        onClick: function () {
                          S(!0), B(!1), A(!1), F(!1), Y($);
                        },
                        children: "CONSUMABLE PARTS",
                      },
                      "Consumable3"
                    ),
                    Object(j.jsx)(
                      "button",
                      {
                        className: "ButBennys",
                        onClick: function () {
                          A(!1), B(!1), S(!1), F(!0), W(ot);
                        },
                        style: { left: "28%" },
                        children: "CART",
                      },
                      "Consumable4"
                    ),
                    Object(j.jsx)("button", {
                      className: "CounterBennysItems",
                      children: l,
                    }),
                    Object(j.jsx)("div", {
                      className: "BennysInput",
                      children: Object(j.jsx)("input", {
                        className: "InputBennys",
                        onChange: function (t) {
                          var e,
                            n =
                              ((e = t.target.value),
                              y
                                ? $.filter(function (t) {
                                    return t.item
                                      .toLowerCase()
                                      .includes(e.toLowerCase());
                                  })
                                : performance
                                ? ct.filter(function (t) {
                                    return t.item
                                      .toLowerCase()
                                      .includes(e.toLowerCase());
                                  })
                                : L
                                ? ot.filter(function (t) {
                                    return t.item
                                      .toLowerCase()
                                      .includes(e.toLowerCase());
                                  })
                                : void 0);
                          y ? Y(n) : performance ? _(n) : L && W(n);
                        },
                        placeholder: " Search",
                      }),
                    }),
                    Object(j.jsxs)("div", {
                      className: "bennysContainer",
                      children: [
                        y &&
                          D.map(function (t) {
                            return Object(j.jsx)(P, {
                              icon: t.icon,
                              label: t.label,
                              price: t.price,
                              item: t.item,
                              GenCounter: l,
                              SetGenCounter: u,
                              SetCartItems: bt,
                              ToPay: m,
                              SetToPay: O,
                            });
                          }),
                        I &&
                          q.map(function (t) {
                            return Object(j.jsx)(P, {
                              icon: t.icon,
                              label: t.label,
                              price: t.price,
                              item: t.item,
                              GenCounter: l,
                              SetGenCounter: u,
                              SetCartItems: bt,
                              ToPay: m,
                              SetToPay: O,
                            });
                          }),
                        L &&
                          Q.map(function (t) {
                            return Object(j.jsx)(P, {
                              icon: t.icon,
                              label: t.label,
                              price: t.price,
                              item: t.item,
                              GenCounter: l,
                              SetGenCounter: u,
                              SetCartItems: bt,
                              ToPay: m,
                              SetToPay: O,
                            });
                          }),
                        U &&
                          ut.map(function (t) {
                            return Object(j.jsxs)("div", {
                              className: "bennysItemsCart",
                              children: [
                                Object(j.jsx)("div", {
                                  className: "bennysItemIcon",
                                  children: Object(j.jsx)("img", {
                                    alt: "img",
                                    src: t.icon,
                                    style: {},
                                    width: 32,
                                    height: 32,
                                  }),
                                }),
                                Object(j.jsx)("p", {
                                  className: "CartItemText",
                                  children: "- "
                                    .concat(t.label, "(1x) - ")
                                    .concat(t.price, " GNE"),
                                }),
                                Object(j.jsx)(
                                  "button",
                                  {
                                    className: "ButBennysCart",
                                    onClick: function () {
                                      return (function (t) {
                                        u(l - 1),
                                          O(m - t.price),
                                          bt(function (e) {
                                            var n = Object(r.a)(e),
                                              c = n.findIndex(function (e) {
                                                return e.index === t.index;
                                              });
                                            return n.splice(c, 1), n;
                                          });
                                      })(t);
                                    },
                                    children: "REMOVE ITEM",
                                  },
                                  "CartItems"
                                ),
                              ],
                            });
                          }),
                        U &&
                          Object(j.jsx)(j.Fragment, {
                            children: Object(j.jsxs)("div", {
                              className: "CartCheckout",
                              children: [
                                Object(j.jsx)("p", {
                                  className: "CheckoutText",
                                  children: "Total ".concat(m, " GNE"),
                                }),
                                Object(j.jsx)(
                                  "button",
                                  {
                                    className: "CheckOut",
                                    onClick: function () {
                                      x("ps-boosting:BennysItem", {
                                        CartItems: ut,
                                        ToPay: m,
                                      }).then(function (t) {
                                        t.Continue && (bt([]), u(0), O(0));
                                      });
                                    },
                                    children: "CHECKOUT",
                                  },
                                  "CartItems"
                                ),
                              ],
                            }),
                          }),
                      ],
                    }),
                    Object(j.jsx)("p", {
                      className: "GNE",
                      style: { top: "3%" },
                      children: "Your GNE ".concat(f),
                    }),
                  ],
                }),
              }),
            }),
          });
        }),
        A = n.p + "static/media/cog.540ab5dc.svg",
        R = n.p + "static/media/comment.c11482d5.svg",
        G = n.p + "static/media/wifi.71ec6722.svg",
        U = function (t) {
          var e = t.counter;
          t.setCounter;
          return Object(j.jsx)("div", {
            children: Object(j.jsx)(C.a, {
              defaultPosition: { x: 0, y: -440 },
              children: Object(j.jsx)("div", {
                className: e ? "" : "hiddenComponent",
                children: Object(j.jsxs)("div", {
                  className: "GneFinance",
                  children: [
                    Object(j.jsx)(
                      "button",
                      {
                        className: "btn close-btn",
                        style: { top: "-5%", left: "74%" },
                      },
                      "cclose-btn"
                    ),
                    Object(j.jsx)(
                      "button",
                      {
                        className: "btn min-btn",
                        style: { top: "-5%", left: "65%" },
                      },
                      "cmin-btn"
                    ),
                    Object(j.jsx)("div", {
                      className: "texto boosting-text",
                      children: "GNE Finance",
                    }),
                  ],
                }),
              }),
            }),
          });
        };
      var F = function () {
          var t = Object(c.useState)(!1),
            e = Object(o.a)(t, 2),
            n = e[0],
            s = e[1],
            i = Object(c.useState)(!1),
            a = Object(o.a)(i, 2),
            r = a[0],
            l = a[1],
            u = Object(c.useState)(!1),
            b = Object(o.a)(u, 2),
            d = b[0],
            m = b[1],
            O = Object(c.useState)(!1),
            p = Object(o.a)(O, 2),
            h = p[0],
            f = p[1],
            g = Object(c.useState)(function () {
              return (
                JSON.parse(localStorage.getItem("boostingLaptop")) ||
                "https://imgur.com/o4VGrTt.png"
              );
            }),
            v = Object(o.a)(g, 2),
            C = v[0],
            y = v[1],
            S = Object(c.useState)(!1),
            E = Object(o.a)(S, 2),
            I = E[0],
            B = E[1],
            k = Object(c.useState)({ visible: !1 }),
            P = Object(o.a)(k, 2),
            F = P[0],
            M = P[1],
            V = Object(c.useState)({ time: "00:00" }),
            D = Object(o.a)(V, 2),
            Y = D[0],
            K = D[1];
          return (
            Object(c.useEffect)(function () {
              window.addEventListener("message", function (t) {
                var e;
                t.data &&
                  ("openApplication" === (e = t.data).action
                    ? "OpenBoostingApp" === e.app && M({ visible: e.show })
                    : "UpdateValueUI" === e.action &&
                      "BoostingApp" === e.app &&
                      K({ time: e.data.time }));
              });
            }, []),
            Object(c.useEffect)(
              function () {
                localStorage.setItem("boostingLaptop", JSON.stringify(C));
              },
              [C]
            ),
            Object(c.useEffect)(
              function () {
                function t(t) {
                  "Escape" === t.code &&
                    (M({ visible: !1 }), x("ps-boosting:closeBoostingApp", {}));
                }
                return (
                  document.addEventListener("keydown", t),
                  function () {
                    return document.removeEventListener("keydown", t);
                  }
                );
              },
              [F, M]
            ),
            Object(j.jsx)("div", {
              style: F.visible
                ? { visibility: "visible" }
                : { visibility: "hidden" },
              children: Object(j.jsx)("div", {
                className: "rectangule",
                children: Object(j.jsx)("div", {
                  className: "container",
                  style: { backgroundImage: "URL('".concat(C, "')") },
                  children: Object(j.jsxs)("div", {
                    className: "windows_bar",
                    children: [
                      Object(j.jsxs)("div", {
                        className: "IconVariables",
                        children: [
                          Object(j.jsx)("button", {
                            className: "color3",
                            style: {},
                            children: Object(j.jsx)("img", {
                              alt: "img",
                              src: "https://imgur.com/henVG66.png",
                              width: "19",
                              height: "19",
                            }),
                          }),
                          n &&
                            Object(j.jsx)("button", {
                              className: "OpenedButton",
                              style: {},
                              children: Object(j.jsx)("img", {
                                alt: "img",
                                src: "https://imgur.com/FEPqpLc.png",
                                height: 19,
                                width: 19,
                              }),
                            }),
                          r &&
                            Object(j.jsx)("button", {
                              className: "OpenedButton",
                              style: {},
                              children: Object(j.jsx)("img", {
                                alt: "img",
                                src: "https://imgur.com/kGxkXTk.png",
                                height: 19,
                                width: 19,
                              }),
                            }),
                          I &&
                            Object(j.jsx)("button", {
                              className: "OpenedButton",
                              style: {},
                              children: Object(j.jsx)("img", {
                                alt: "img",
                                src: "https://imgur.com/O10Rx0A.png",
                                height: 19,
                                width: 19,
                              }),
                            }),
                        ],
                      }),
                      Object(j.jsx)("button", {
                        onClick: function () {
                          m(!0);
                        },
                        className: "color",
                        style: { left: "87%" },
                        children: Object(j.jsx)("img", {
                          alt: "img",
                          src: A,
                          className: "filter-white",
                          style: { color: "white" },
                          height: 17,
                          width: 17,
                        }),
                      }),
                      Object(j.jsx)("button", {
                        className: "color2",
                        children: Object(j.jsx)("img", {
                          alt: "img",
                          src: G,
                          style: { color: "white" },
                          className: "filter-white",
                          height: 17,
                          width: 17,
                        }),
                      }),
                      Object(j.jsx)("button", {
                        onClick: function () {
                          f(!0);
                        },
                        className: "color",
                        style: { left: "97%" },
                        children: Object(j.jsx)("img", {
                          alt: "img",
                          src: R,
                          style: { color: "white" },
                          className: "filter-white",
                          height: 17,
                          width: 17,
                        }),
                      }),
                      Object(j.jsx)("div", {
                        className: "textohora",
                        children: Y.time,
                      }),
                      Object(j.jsxs)("div", {
                        className: "windows_apps",
                        children: [
                          Object(j.jsxs)("button", {
                            onClick: function () {
                              s(!0);
                            },
                            className: "win_apps",
                            style: { marginLeft: "0.5em" },
                            children: [
                              Object(j.jsx)("img", {
                                height: 40,
                                width: 40,
                                alt: "img",
                                src: "https://imgur.com/FEPqpLc.png",
                              }),
                              "Boosting",
                            ],
                          }),
                          Object(j.jsxs)("button", {
                            onClick: function () {
                              l(!0);
                            },
                            className: "win_apps",
                            style: { marginLeft: "0.5em" },
                            children: [
                              Object(j.jsx)("img", {
                                height: 40,
                                width: 40,
                                alt: "img",
                                src: "https://imgur.com/kGxkXTk.png",
                              }),
                              "Bennys Parts",
                            ],
                          }),
                        ],
                      }),
                      Object(j.jsx)(N, { counter: n, setCounter: s }),
                      Object(j.jsx)(U, { counter: I, setCounter: B }),
                      Object(j.jsx)(T, {
                        counter: d,
                        setCounter: m,
                        setWallpaper: y,
                      }),
                      Object(j.jsx)(L, { counter: r, setCounter: l }),
                      Object(j.jsx)(w, { counter: h, setCounter: f }),
                    ],
                  }),
                }),
              }),
            })
          );
        },
        M = function () {
          return Object(j.jsx)("div", { children: Object(j.jsx)(F, {}) });
        };
      a.a.render(
        Object(j.jsx)(s.a.StrictMode, { children: Object(j.jsx)(M, {}) }),
        document.getElementById("root")
      );
    },
  },
  [[98, 1, 2]],
]);
//# sourceMappingURL=main.5ea59cb9.chunk.js.map
