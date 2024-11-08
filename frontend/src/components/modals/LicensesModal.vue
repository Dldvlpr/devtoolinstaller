<template>
  <div class="modal fade" id="licensesModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-white">Licenses</h5>
          <button
            type="button"
            class="btn-close btn-close-white"
            data-bs-dismiss="modal"
          ></button>
        </div>
        <div class="modal-body text-light">
          <div class="licenses-content">
            <section class="mb-4">
              <h6 class="text-primary">DevToolInstaller License</h6>
              <p class="small">
                Copyright (c) 2024 DevToolInstaller<br />
                MIT License
              </p>
              <p>
                Permission is hereby granted, free of charge, to any person
                obtaining a copy of this software and associated documentation
                files (the "Software"), to deal in the Software without
                restriction, including without limitation the rights to use,
                copy, modify, merge, publish, distribute, sublicense, and/or
                sell copies of the Software...
              </p>
            </section>

            <section class="mb-4">
              <h6 class="text-primary">Third-Party Licenses</h6>
              <p>
                DevToolInstaller installs various third-party software packages.
                Each package is subject to its own license terms. Common
                licenses include:
              </p>
              <ul>
                <li>MIT License</li>
                <li>Apache License 2.0</li>
                <li>GNU General Public License (GPL)</li>
                <li>BSD License</li>
              </ul>
              <p>
                Users are responsible for complying with the license terms of
                each installed package.
              </p>
            </section>

            <section class="mb-4">
              <h6 class="text-primary">Dependencies</h6>
              <p>DevToolInstaller uses the following open-source packages:</p>
              <ul>
                <li>Vue.js - MIT License</li>
                <li>Bootstrap - MIT License</li>
                <li>Python - PSF License</li>
                <li>Various package managers (npm, pip, etc.)</li>
              </ul>
            </section>

            <section>
              <h6 class="text-primary">Commercial Use</h6>
              <p>
                While DevToolInstaller is free for personal and commercial use,
                some installed packages may have different licensing terms for
                commercial applications. Please review individual package
                licenses for commercial use requirements.
              </p>
            </section>
          </div>
        </div>
        <div class="modal-footer">
          <button
            type="button"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
