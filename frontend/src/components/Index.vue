<template>
  <div class="bg-dark text-light">
    <div
      class="modal fade"
      id="howItWorksModal"
      tabindex="-1"
      aria-labelledby="howItWorksModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content bg-dark border-light">
          <div class="modal-header border-secondary">
            <h5 class="modal-title text-white" id="howItWorksModalLabel">
              How It Works
            </h5>
            <button
              type="button"
              class="btn-close btn-close-white"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body d-flex justify-content-center">
            <div class="steps">
              <div class="step d-flex align-items-start mb-4">
                <div class="step-number">1</div>
                <div class="step-content">
                  <h5 class="text-white mb-1">Choose Your OS</h5>
                  <p class="text-light-emphasis mb-0">
                    Select your operating system from the dropdown
                  </p>
                </div>
              </div>
              <div class="step d-flex align-items-start mb-4">
                <div class="step-number">2</div>
                <div class="step-content">
                  <h5 class="text-white mb-1">Run the Command</h5>
                  <p class="text-light-emphasis mb-0">
                    Copy and paste the installation command in your terminal
                  </p>
                </div>
              </div>
              <div class="step d-flex align-items-start mb-4">
                <div class="step-number">3</div>
                <div class="step-content">
                  <h5 class="text-white mb-1">Select Tools</h5>
                  <p class="text-light-emphasis mb-0">
                    Choose the development tools you want to install
                  </p>
                </div>
              </div>
              <div class="step d-flex align-items-start">
                <div class="step-number">4</div>
                <div class="step-content">
                  <h5 class="text-white mb-1">Start Coding</h5>
                  <p class="text-light-emphasis mb-0">
                    Your development environment is ready to use!
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer border-secondary">
            <button
              type="button"
              class="btn btn-primary"
              data-bs-dismiss="modal"
            >
              Got it!
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="navigation-dots">
      <a
        v-for="(section, index) in sections"
        :key="section.id"
        href="#"
        :class="['nav-dot', { active: currentSection === index }]"
        @click.prevent="scrollToSection(section.id)"
      ></a>
    </div>

    <section id="hero" class="section-height d-flex align-items-center">
      <div class="container text-center">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <img
              :src="logoUrl"
              alt="DevToolInstaller Logo"
              class="img-fluid mb-3 fade-in"
              style="max-height: 120px"
            />
            <h1 class="display-5 mb-3 fw-bold text-white fade-in-delay-1">
              DevToolInstaller
            </h1>
            <p class="lead mb-4 text-light fade-in-delay-2">
              Your Development Setup, Simplified - From Fresh Install to Full
              Stack in Minutes
            </p>
          </div>
        </div>
      </div>
      <div class="scroll-arrow bottom" @click="scrollToSection('get-started')">
        <i class="bi bi-chevron-down bounce"></i>
      </div>
    </section>

    <section id="get-started" class="section-height d-flex align-items-center">
      <div class="scroll-arrow top" @click="scrollToSection('hero')">
        <i class="bi bi-chevron-up fade-in"></i>
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="info-box p-3 rounded mb-4">
            <div class="d-flex align-items-center mb-2">
              <i class="bi bi-info-circle text-info me-2"></i>
              <h5 class="text-light mb-0">General Information</h5>
            </div>
            <p class="text-muted mb-0">
              Once the command is copied and pasted into your terminal, a shell
              will open and execute the script automatically. No further actions
              are required.
            </p>
          </div>
          <div class="info-box p-3 rounded mb-4">
            <div class="d-flex align-items-center mb-2">
              <i class="bi bi-terminal text-info me-2"></i>
              <h5 class="text-light mb-0">Installation Process</h5>
            </div>
            <p class="text-muted mb-0">
              {{ osExplanation }}
            </p>
          </div>
          <div class="col-md-8">
            <div class="card bg-dark border-secondary fade-in">
              <div class="card-body">
                <h2 class="text-center mb-4 text-white">Get Started</h2>
                <div class="mb-4">
                  <select
                    v-model="selectedOS"
                    class="form-select form-select-lg bg-dark text-light border-secondary"
                  >
                    <option value="windows">Windows</option>
                    <option value="unix">Linux/MacOS</option>
                  </select>
                </div>
                <div class="bg-black p-3 rounded mb-4 command-box">
                  <div
                    class="d-flex justify-content-between align-items-center mb-2"
                  >
                    <small class="text-light">Installation Command</small>
                    <button
                      @click="copyCommand"
                      class="btn btn-sm btn-outline-primary copy-btn"
                    >
                      {{ copied ? "Copied!" : "Copy" }}
                    </button>
                  </div>
                  <code class="text-success d-block">{{ installCommand }}</code>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="scroll-arrow bottom" @click="scrollToSection('features')">
        <i class="bi bi-chevron-down bounce"></i>
      </div>
    </section>

    <section id="features" class="section-height d-flex align-items-center">
      <div class="scroll-arrow top" @click="scrollToSection('get-started')">
        <i class="bi bi-chevron-up fade-in"></i>
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <h2 class="text-center mb-4 text-white fade-in">
              Available Features in future
            </h2>
            <div class="row g-4">
              <div
                class="col-md-6"
                v-for="(feature, index) in features"
                :key="index"
              >
                <div
                  class="card bg-dark border-secondary h-100 feature-card fade-in-delay-1"
                >
                  <div class="card-body">
                    <h5 class="card-title text-white">
                      <i :class="`bi ${feature.icon} text-success me-2`"></i>
                      {{ feature.title }}
                    </h5>
                    <p class="card-text text-light-emphasis">
                      {{ feature.description }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="scroll-arrow bottom" @click="scrollToSection('footer')">
        <i class="bi bi-chevron-down bounce"></i>
      </div>
    </section>

    <section id="footer" class="section-height d-flex align-items-center">
      <div class="scroll-arrow top" @click="scrollToSection('features')">
        <i class="bi bi-chevron-up fade-in"></i>
      </div>
      <div class="container">
        <div class="row g-4 justify-content-center">
          <div class="col-md-4 text-center text-md-start">
            <img
              :src="logoUrl"
              alt="DevToolInstaller"
              class="footer-logo mb-3"
              style="height: 40px"
            />
            <p class="small mb-0 text-light-emphasis">
              Copyright © {{ currentYear }} DevToolInstaller.<br />
              All rights reserved.
            </p>
          </div>

          <div class="col-md-4">
            <h6 class="text-white mb-3">Quick Links</h6>
            <ul class="list-unstyled">
              <li>
                <a
                  @click="scrollToSection('get-started')"
                  href="#"
                  class="footer-link"
                >
                  Get Started
                </a>
              </li>
              <li>
                <a
                  @click="scrollToSection('features')"
                  href="#"
                  class="footer-link"
                >
                  Features
                </a>
              </li>
            </ul>
          </div>

          <div class="col-md-4">
            <h6 class="text-white mb-3">Legal</h6>
            <ul class="list-unstyled">
              <li>
                <a
                  href="#"
                  @click.prevent="showModal('termsModal')"
                  class="footer-link"
                >
                  Terms of Use
                </a>
              </li>
              <li>
                <a
                  href="#"
                  @click.prevent="showModal('privacyModal')"
                  class="footer-link"
                >
                  Privacy Policy
                </a>
              </li>
              <li>
                <a
                  href="#"
                  @click.prevent="showModal('licensesModal')"
                  class="footer-link"
                >
                  Licenses
                </a>
              </li>
            </ul>
          </div>

          <div class="col-12">
            <hr class="border-secondary my-4" />
          </div>

          <div class="col-md-6 text-center text-md-start">
            <p class="small text-light-emphasis mb-0">
              Made with <i class="bi bi-heart-fill text-danger"></i> for
              developers
            </p>
          </div>
          <div class="col-md-6 text-center text-md-end">
            <div class="social-links">
              <a
                href="https://www.linkedin.com/in/ludovic-dormoy-b67471130"
                class="social-link ms-3"
              >
                <i class="bi bi-linkedin"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { Modal } from "bootstrap/dist/js/bootstrap.bundle.min.js";

export default {
  data() {
    return {
      logoUrl: new URL("../assets/devToolInstaller-logo.png", import.meta.url)
        .href,
      selectedOS: "windows",
      copied: false,
      currentSection: 0,
      howItWorksModal: null,
      currentYear: new Date().getFullYear(),
      sections: [
        { id: "hero", name: "Hero" },
        { id: "get-started", name: "Get Started" },
        { id: "features", name: "Features" },
        { id: "footer", name: "Footer" },
      ],
      features: [
        {
          title: "Languages",
          icon: "bi-terminal-fill",
          description: "Python, Node.js, Java, Go, Ruby, PHP and more",
        },
        {
          title: "Editors",
          icon: "bi-pencil-fill",
          description: "VS Code, Sublime Text, Vim, Neovim",
        },
        {
          title: "Development Tools",
          icon: "bi-tools",
          description: "Git, Docker, Docker Compose, Kubernetes CLI, Postman",
        },
        {
          title: "Databases",
          icon: "bi-database-fill",
          description: "PostgreSQL, MongoDB, MySQL, Redis",
        },
      ],
    };
  },
  computed: {
    installCommand() {
      const commands = {
        windows: `
        Comming Soon !
        `,
        unix: `
        Comming Soon !
        `,
      };

      return this.selectedOS === "windows" ? commands.windows : commands.unix;
    },
    osExplanation() {
      if (this.selectedOS === "windows") {
        return `On Windows, this command will automatically verify if the latest
                versions of Python and PowerShell are installed on your system. If any
                required version is missing or outdated, the tool will handle the installation
                or update process to ensure your environment meets the necessary requirements.`;
      } else {
        return `On Linux/MacOS, this command will automatically check if Python 3 is installed
                and up to date. If a required version is missing or outdated, the tool will
                manage the installation or update to ensure compatibility with the application.`;
      }
    },
  },
  mounted() {
    this.initModal();
    window.addEventListener("scroll", this.handleScroll);
    this.showHowItWorksModal();
  },
  beforeUnmount() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    showModal(modalId) {
      const modal = new Modal(document.getElementById(modalId));
      modal.show();
    },
    initModal() {
      this.howItWorksModal = new Modal(
        document.getElementById("howItWorksModal"),
        {
          backdrop: "static",
        }
      );
    },
    showHowItWorksModal() {
      setTimeout(() => {
        this.howItWorksModal?.show();
      }, 1000);
    },
    async copyCommand() {
      try {
        await navigator.clipboard.writeText(this.installCommand);
        this.copied = true;
        setTimeout(() => {
          this.copied = false;
        }, 2000);
      } catch (err) {
        console.error("Failed to copy command:", err);
      }
    },
    scrollToSection(targetId) {
      const targetElement = document.getElementById(targetId);
      if (targetElement) {
        targetElement.scrollIntoView({ behavior: "smooth" });
      }
    },
    handleScroll() {
      const sections = this.sections.map((section) =>
        document.getElementById(section.id)
      );

      const pageYOffset = window.pageYOffset;
      const windowHeight = window.innerHeight;

      sections.forEach((section, index) => {
        if (section) {
          const sectionTop = section.offsetTop;
          const sectionBottom = sectionTop + section.offsetHeight;

          if (
            pageYOffset >= sectionTop - windowHeight / 2 &&
            pageYOffset < sectionBottom - windowHeight / 2
          ) {
            this.currentSection = index;
          }
        }
      });
    },
  },
};
</script>

<style scoped>
.section-height {
  min-height: 100vh;
  position: relative;
  padding: 60px 0;
}

.scroll-arrow {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  color: #fff;
  font-size: 2rem;
  opacity: 0.7;
  transition: all 0.3s ease;
  cursor: pointer;
  z-index: 10;
}

.scroll-arrow:hover {
  opacity: 1;
  color: #0d6efd;
}

.scroll-arrow.top {
  top: 20px;
}

.scroll-arrow.bottom {
  bottom: 20px;
}

.bounce {
  animation: bounce 2s infinite;
}

@keyframes bounce {
  0%,
  20%,
  50%,
  80%,
  100% {
    transform: translateY(0) translateX(-50%);
  }
  40% {
    transform: translateY(-10px) translateX(-50%);
  }
  60% {
    transform: translateY(-5px) translateX(-50%);
  }
}

.navigation-dots {
  position: fixed;
  right: 20px;
  top: 50%;
  transform: translateY(-50%);
  z-index: 1000;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.nav-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.5);
  transition: all 0.3s ease;
  cursor: pointer;
}

.nav-dot:hover,
.nav-dot.active {
  background-color: #fff;
  transform: scale(1.2);
}

.feature-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.steps {
  max-width: 500px;
  width: 100%;
}

.step {
  display: flex;
  align-items: flex-start;
}

.step-number {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: #198754;
  color: white;
  font-weight: bold;
  margin-right: 10px;
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.2rem;
}

.step-content {
  flex: 1;
}

.step-content h5 {
  font-size: 1.1rem;
  text-align: left;
}

.step-content p {
  font-size: 0.95rem;
  color: #adb5bd;
  text-align: left;
}

.modal-body {
  display: flex;
  justify-content: center;
}

.step:not(:last-child) {
  border-bottom: 1px solid #343a40;
  padding-bottom: 15px;
  margin-bottom: 15px;
}

.fade-in {
  opacity: 0;
  animation: fadeIn 0.8s ease forwards;
}

.fade-in-delay-1 {
  opacity: 0;
  animation: fadeIn 0.8s ease 0.2s forwards;
}

.fade-in-delay-2 {
  opacity: 0;
  animation: fadeIn 0.8s ease 0.4s forwards;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.modal-content {
  background-color: #212529 !important;
}

@media (max-width: 768px) {
  .navigation-dots {
    display: none;
  }

  .section-height {
    min-height: auto;
    padding: 40px 0;
  }

  .scroll-arrow {
    font-size: 1.5rem;
  }

  .steps {
    max-width: 100%;
    padding: 0 15px;
  }

  .step-number {
    width: 35px;
    height: 35px;
    margin-right: 15px;
  }

  .step-content h5 {
    font-size: 1rem;
  }

  .step-content p {
    font-size: 0.9rem;
  }
}

.command-box {
  border: 1px solid #2c3034;
  transition: all 0.3s ease;
}

.command-box:hover {
  border-color: #0d6efd;
}

code {
  font-size: 1rem;
  padding: 0.5rem;
  border-radius: 4px;
  width: 100%;
  white-space: nowrap;
  overflow-x: auto;
}

.copy-btn {
  transition: all 0.3s ease;
}

.copy-btn:hover {
  transform: scale(1.05);
}

.form-select {
  cursor: pointer;
  transition: all 0.3s ease;
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e");
}

.form-select:hover {
  border-color: #0d6efd;
}

.form-select:focus {
  border-color: #0d6efd;
  box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
}

.footer-logo {
  filter: brightness(0.9);
}

.footer-link {
  color: #6c757d;
  text-decoration: none;
  transition: color 0.3s ease;
  cursor: pointer;
}

.footer-link:hover {
  color: #fff;
  text-decoration: none;
}

.social-link {
  color: #6c757d;
  font-size: 1.2rem;
  text-decoration: none;
  transition: color 0.3s ease;
}

.social-link:hover {
  color: #fff;
}

.info-box {
  background-color: #2c3034;
  border: 1px solid #444;
  transition: all 0.3s ease;
}

.info-box:hover {
  border-color: #0d6efd;
}

.info-box h5 {
  font-size: 1.1rem;
  font-weight: bold;
}

.info-box p {
  font-size: 0.95rem;
  color: #adb5bd;
}

.bi-info-circle,
.bi-terminal {
  font-size: 1.2rem;
  color: #0d6efd;
}
</style>
